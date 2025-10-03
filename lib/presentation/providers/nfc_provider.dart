// lib/providers/nfc_provider.dart
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/frontend_models/consumer_card.dart';
import '../../data/models/frontend_models/credit_request.dart';
import '../../data/models/frontend_models/enums.dart';
import 'package:uuid/uuid.dart';

// NFCState sınıfı
@immutable
class NFCState {
  const NFCState({
    this.isLoading = false,
    this.message = '',
    this.cardData,
    this.isNfcEnabled = false,
    this.licenseStatus = '',
    this.debugLog = '',
    this.lastWriteRequestId = '',
    this.isWriteInProgress = false,
    this.writeCompleted = false,
    this.initialCardSeriNo = '', // İlk okunan kart seri numarası
  });

  final bool isLoading;
  final String message;
  final ConsumerCard? cardData;
  final bool isNfcEnabled;
  final String licenseStatus;
  final String debugLog;
  final String lastWriteRequestId;
  final bool isWriteInProgress;
  final bool writeCompleted;
  final String initialCardSeriNo; // İlk okunan kartın seri numarası

  NFCState copyWith({
    bool? isLoading,
    String? message,
    ConsumerCard? cardData,
    bool? isNfcEnabled,
    String? licenseStatus,
    String? debugLog,
    String? lastWriteRequestId,
    bool? isWriteInProgress,
    bool? writeCompleted,
    String? initialCardSeriNo,
  }) {
    return NFCState(
      isLoading: isLoading ?? this.isLoading,
      message: message ?? this.message,
      cardData: cardData ?? this.cardData,
      isNfcEnabled: isNfcEnabled ?? this.isNfcEnabled,
      licenseStatus: licenseStatus ?? this.licenseStatus,
      debugLog: debugLog ?? this.debugLog,
      lastWriteRequestId: lastWriteRequestId ?? this.lastWriteRequestId,
      isWriteInProgress: isWriteInProgress ?? this.isWriteInProgress,
      writeCompleted: writeCompleted ?? this.writeCompleted,
      initialCardSeriNo: initialCardSeriNo ?? this.initialCardSeriNo,
    );
  }
}

class NFCNotifier extends StateNotifier<NFCState> {
  NFCNotifier() : super(const NFCState()) {
    print('🏁 NFCNotifier constructor called');
    _initializeNFC();
    _listenToNFCEvents();
  }

  static const platform = MethodChannel('com.example.kaski_nfc_app/methods');
  static const eventChannel = EventChannel('com.example.kaski_nfc_app/events');

  DateTime? _lastWriteStartTime;
  final _uuid = const Uuid();

  // Debug bilgileri için yeni propertyler
  void _addDebugLog(String log) {
    final timestamp = DateTime.now().toString().substring(11, 19);
    final newDebugLog = state.debugLog + '[$timestamp] $log\n';
    print('🔍 DEBUG: $log');

    // Debug log'u maksimum 50 satır tut
    final lines = newDebugLog.split('\n');
    final finalDebugLog = lines.length > 50
        ? lines.sublist(lines.length - 50).join('\n')
        : newDebugLog;

    state = state.copyWith(debugLog: finalDebugLog);
  }

  void clearDebugLog() {
    state = state.copyWith(debugLog: '');
  }

  void _initializeNFC() async {
    try {
      _addDebugLog('NFC initialization started');
      await platform.invokeMethod('activateNFC');
      _addDebugLog('NFC activated successfully');
      await _checkLicense();
    } catch (e) {
      state = state.copyWith(message: 'Failed to initialize NFC: $e');
      _addDebugLog('NFC initialization failed: $e');
    }
  }

  void _listenToNFCEvents() {
    _addDebugLog('Starting NFC event listener');
    eventChannel.receiveBroadcastStream().listen(
      (dynamic event) {
        _handleNFCEvent(event);
      },
      onError: (dynamic error) {
        state = state.copyWith(
          message: 'NFC Event Error: $error',
          isLoading: false,
          isWriteInProgress: false,
        );
        _addDebugLog('NFC Event Error: $error');
      },
    );
  }

  void _handleNFCEvent(dynamic event) {
    try {
      final Map<String, dynamic> eventData = Map<String, dynamic>.from(event);
      final String eventType = eventData['type'] ?? '';

      _addDebugLog('Received event: $eventType');
      print('📱 Received NFC Event: $eventType');
      print('📊 Event data: $eventData');

      switch (eventType) {
        case 'licenseStatus':
          _handleLicenseStatus(eventData);
          break;
        case 'onResult':
          _handleOnResult(eventData);
          break;
        case 'readCardResult':
          _handleReadCardResult(eventData);
          break;
        case 'writeCardResult':
          _handleWriteCardResult(eventData);
          break;
        case 'error':
          _handleError(eventData);
          break;
        default:
          _addDebugLog('Unknown event type: $eventType');
          print('⚠️ Unknown event type: $eventType');
      }
    } catch (e) {
      print('❌ Error handling NFC event: $e');
      _addDebugLog('Error handling event: $e');
      state = state.copyWith(
        message: 'Error processing NFC event: $e',
        isLoading: false,
        isWriteInProgress: false,
      );
    }
  }

  void _handleLicenseStatus(Map<String, dynamic> eventData) {
    final String? message = eventData['message'];
    final licenseStatus = message ?? 'Unknown license status';
    state = state.copyWith(licenseStatus: licenseStatus);
    _addDebugLog('License status: $licenseStatus');
    print('📄 License status updated: $licenseStatus');
  }

  void _handleOnResult(Map<String, dynamic> eventData) {
    final String? tag = eventData['tag'];
    final String? resultCode = eventData['code'];

    final message = tag ?? 'Unknown result';
    _addDebugLog('OnResult - Tag: $tag, Code: $resultCode');

    if (resultCode == 'CardReaded') {
      state = state.copyWith(message: message, isLoading: false);
    } else {
      state = state.copyWith(message: message);
    }

    print('🔄 OnResult - Tag: $tag, Code: $resultCode');
  }

  void _handleReadCardResult(Map<String, dynamic> eventData) {
    final String? resultCode = eventData['code'];

    _addDebugLog('Read card result: $resultCode');
    print('📖 Read card result - Code: $resultCode');

    if (resultCode == 'Success') {
      final dynamic cardDataRaw = eventData['cardData'];

      if (cardDataRaw != null) {
        try {
          final Map<String, dynamic> cardDataMap = _safeConvertToMap(
            cardDataRaw,
          );
          _addDebugLog('Card data converted successfully');
          print('🗺️ Safe card data map: $cardDataMap');

          final cardData = ConsumerCard.fromJson(cardDataMap);

          // İlk kart okuma ise kartın seri numarasını kaydet
          String initialCardSeriNo = state.initialCardSeriNo;
          if (initialCardSeriNo.isEmpty && cardData.cardSeriNo != null) {
            initialCardSeriNo = cardData.cardSeriNo!;
            _addDebugLog('Initial card seri no set: $initialCardSeriNo');
            print('🔒 Initial card seri no saved: $initialCardSeriNo');
          }

          state = state.copyWith(
            cardData: cardData,
            message: 'Card read successfully',
            isLoading: false,
            initialCardSeriNo: initialCardSeriNo,
          );
          _addDebugLog('Card data: ${cardData.toString()}');
          print('✅ Card data created successfully: $cardData');
        } catch (e) {
          print('❌ Error converting card data: $e');
          _addDebugLog('Error converting card data: $e');
          state = state.copyWith(
            message: 'Error processing card data: $e',
            cardData: null,
            isLoading: false,
          );
        }
      } else {
        print('⚠️ Card data is null');
        _addDebugLog('Card data is null');
        state = state.copyWith(
          message: 'Card data is empty',
          cardData: null,
          isLoading: false,
        );
      }
    } else {
      final message = _getErrorMessage(resultCode);
      state = state.copyWith(
        message: message,
        cardData: null,
        isLoading: false,
      );
      _addDebugLog('Card read failed: $resultCode');
      print('❌ Card read failed: $resultCode');
    }
  }

  void _handleWriteCardResult(Map<String, dynamic> eventData) {
    final String? resultCode = eventData['code'];

    String durationText = '';
    if (_lastWriteStartTime != null) {
      final duration = DateTime.now().difference(_lastWriteStartTime!);
      durationText = ' (${duration.inMilliseconds}ms)';
    }

    _addDebugLog('Write card result: $resultCode$durationText');
    _addDebugLog('Write request ID was: ${state.lastWriteRequestId}');

    String message;
    bool writeCompleted = false;

    if (resultCode == 'Success') {
      message = 'Card written successfully';
      writeCompleted = true;
      _addDebugLog('✅ WRITE SUCCESSFUL - Card was actually updated!');
      print('✅ Card write successful');

      // Write başarılı olduğunda kart verisini tekrar oku
      Future.delayed(const Duration(milliseconds: 1000), () {
        if (state.cardData != null) {
          readCard();
        }
      });
    } else if (resultCode == 'ReadCardAgain') {
      message = 'Please place the card again and retry';
      _addDebugLog('⚠️ Need to read card again');
      print('⚠️ Card write requires card to be read again: $resultCode');
    } else {
      message = _getErrorMessage(resultCode);
      _addDebugLog('❌ WRITE FAILED: $resultCode');
      print('❌ Card write failed: $resultCode');
    }

    state = state.copyWith(
      isLoading: false,
      isWriteInProgress: false,
      message: message,
      writeCompleted: writeCompleted,
      lastWriteRequestId: '', // Sıfırla
    );

    _lastWriteStartTime = null;
  }

  void _handleError(Map<String, dynamic> eventData) {
    final String? errorMessage = eventData['message'];
    final message = errorMessage ?? 'Unknown error occurred';
    state = state.copyWith(
      isLoading: false,
      isWriteInProgress: false,
      message: message,
    );
    _addDebugLog('Error event: $message');
    print('❌ Error event: $message');
  }

  Map<String, dynamic> _safeConvertToMap(dynamic data) {
    if (data is Map<String, dynamic>) {
      return data;
    } else if (data is Map) {
      final Map<String, dynamic> result = {};
      data.forEach((key, value) {
        if (key is String) {
          result[key] = _safeConvertValue(value);
        }
      });
      return result;
    } else {
      print('⚠️ Data is not a map: ${data.runtimeType}');
      return {};
    }
  }

  dynamic _safeConvertValue(dynamic value) {
    if (value == null) {
      return null;
    } else if (value is String ||
        value is int ||
        value is double ||
        value is bool) {
      return value;
    } else if (value is num) {
      return value.toDouble();
    } else if (value is Map) {
      return _safeConvertToMap(value);
    } else if (value is List) {
      return value.map(_safeConvertValue).toList();
    } else {
      try {
        return value.toString();
      } catch (e) {
        return "Unknown";
      }
    }
  }

  String _getErrorMessage(String? resultCode) {
    switch (resultCode) {
      case 'CardNotReadYet':
        return 'Please read the card first!';
      case 'ReadCardAgain':
        return 'Please read the card again!';
      case 'Failed':
        return 'Operation failed!';
      case null:
        return 'Unknown error occurred';
      default:
        return 'Error: $resultCode';
    }
  }

  Future<void> _checkLicense() async {
    try {
      const String licenseKey = "9283ebb4-9822-46fa-bbe3-ac4a4d25b8c2";
      final String requestId = _uuid.v4();

      _addDebugLog(
        'Checking license with key: ${licenseKey.substring(0, 8)}...',
      );

      final result = await platform.invokeMethod('getLicense', {
        'licenceKey': licenseKey,
        'requestId': requestId,
      });

      final licenseStatus = result['message'] ?? 'License checked';
      state = state.copyWith(licenseStatus: licenseStatus);
      _addDebugLog('License check result: $licenseStatus');
    } catch (e) {
      final licenseStatus = 'License check failed: $e';
      state = state.copyWith(licenseStatus: licenseStatus);
      _addDebugLog('License check failed: $e');
    }
  }

  // Kart değişimi kontrolü için yeni metod
  bool isCardChanged() {
    if (state.initialCardSeriNo.isEmpty || state.cardData?.cardSeriNo == null) {
      return false;
    }

    final bool changed = state.initialCardSeriNo != state.cardData!.cardSeriNo!;
    if (changed) {
      print('🚨 CARD CHANGED DETECTED!');
      print('  - Initial: ${state.initialCardSeriNo}');
      print('  - Current: ${state.cardData!.cardSeriNo}');
      _addDebugLog(
        'CARD CHANGED! Initial: ${state.initialCardSeriNo}, Current: ${state.cardData!.cardSeriNo}',
      );
    }
    return changed;
  }

  Future<void> toggleNFC(bool enable) async {
    try {
      if (enable) {
        _addDebugLog('Activating NFC...');
        await platform.invokeMethod('activateNFC');
        state = state.copyWith(isNfcEnabled: true, message: 'NFC Activated');
        _addDebugLog('NFC activated');
      } else {
        _addDebugLog('Deactivating NFC...');
        await platform.invokeMethod('disableNFC');
        state = state.copyWith(isNfcEnabled: false, message: 'NFC Deactivated');
        _addDebugLog('NFC deactivated');
      }
    } catch (e) {
      state = state.copyWith(message: 'NFC operation failed: $e');
      _addDebugLog('NFC operation failed: $e');
    }
  }

  Future<void> readCard() async {
    state = state.copyWith(
      isLoading: true,
      message: 'Reading card...',
      cardData: null,
      writeCompleted: false,
    );

    try {
      final String requestId = _uuid.v4();
      _addDebugLog('Starting card read with request ID: $requestId');
      await platform.invokeMethod('readCard', {'requestId': requestId});
      print('📖 Read card request sent with ID: $requestId');
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        message: 'Failed to read card: $e',
      );
      _addDebugLog('Read card failed: $e');
      print('❌ Read card error: $e');
    }
  }

  // Write işlemi öncesi kart okuma ve kontrol
  Future<void> readCardBeforeWrite() async {
    _addDebugLog('Reading card before write operation...');

    state = state.copyWith(isLoading: true, message: 'Validating card...');

    try {
      final String requestId = _uuid.v4();
      _addDebugLog('Starting pre-write card read with request ID: $requestId');
      await platform.invokeMethod('readCard', {'requestId': requestId});
      print('📖 Pre-write card read request sent with ID: $requestId');
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        message: 'Failed to validate card: $e',
      );
      _addDebugLog('Pre-write card read failed: $e');
      print('❌ Pre-write card read error: $e');
    }
  }

  Future<void> writeCard(CreditRequest creditRequest) async {
    _lastWriteStartTime = DateTime.now();

    // Önce kart değişimi kontrolü yap
    if (isCardChanged()) {
      _addDebugLog('❌ CARD CHANGE DETECTED - Write operation blocked!');
      print('🚨 Card change detected - blocking write operation');

      // Async olarak state'i değiştir
      Future.microtask(() {
        state = state.copyWith(
          isLoading: false,
          isWriteInProgress: false,
          writeCompleted: false,
          message: 'DIFFERENT_CARD_DETECTED', // Özel hata kodu
        );
      });
      return;
    }

    state = state.copyWith(
      isLoading: true,
      isWriteInProgress: true,
      writeCompleted: false,
      message: 'Writing to card...',
    );

    try {
      // ✅ RequestId ekleyerek yeni kopya oluştur (Freezed için)
      final updatedRequest = creditRequest.copyWith(requestId: _uuid.v4());

      state = state.copyWith(lastWriteRequestId: updatedRequest.requestId!);

      final Map<String, dynamic> requestMap = {
        'credit': updatedRequest.credit,
        'reserveCreditLimit': updatedRequest.reserveCreditLimit,
        'criticalCreditLimit': updatedRequest.criticalCreditLimit,
        'operationType': _getOperationTypeString(updatedRequest.operationType),
        'requestId': updatedRequest.requestId,
      };

      _addDebugLog('🚀 STARTING WRITE OPERATION');
      _addDebugLog('Request ID: ${state.lastWriteRequestId}');
      _addDebugLog('Credit: ${updatedRequest.credit}');
      _addDebugLog('Operation: ${requestMap['operationType']}');
      _addDebugLog('Card SeriNo: ${state.cardData?.cardSeriNo ?? "Unknown"}');
      _addDebugLog('Initial SeriNo: ${state.initialCardSeriNo}');
      _addDebugLog('Full request: $requestMap');

      print('💳 Write card request: $requestMap');
      await platform.invokeMethod('writeCard', requestMap);

      _addDebugLog('Write command sent to native layer');
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        isWriteInProgress: false,
        message: 'Failed to write card: $e',
        lastWriteRequestId: '',
      );
      _addDebugLog('❌ Write card failed: $e');
      _lastWriteStartTime = null;
      print('❌ Write card error: $e');
    }
  }

  String _getOperationTypeString(OperationType operationType) {
    switch (operationType) {
      case OperationType.none:
        return 'None';
      case OperationType.addCredit:
        return 'AddCredit';
      case OperationType.clearCredits:
        return 'ClearCredits';
      case OperationType.setCredit:
        return 'SetCredit';
    }
  }

  Future<void> setUrl(String url) async {
    try {
      _addDebugLog('Setting URL: $url');
      await platform.invokeMethod('setUrl', {'url': url});
      _addDebugLog('URL set successfully');
    } catch (e) {
      state = state.copyWith(message: 'Failed to set URL: $e');
      _addDebugLog('Failed to set URL: $e');
    }
  }

  void clearMessage() {
    state = state.copyWith(message: '');
  }

  void resetWriteState() {
    state = state.copyWith(
      isWriteInProgress: false,
      writeCompleted: false,
      lastWriteRequestId: '',
    );
    _lastWriteStartTime = null;
  }

  void resetToInitialState() {
    _addDebugLog('🔄 Resetting NFC Provider to initial state');

    state = const NFCState(
      isLoading: false,
      message: '',
      cardData: null,
      isNfcEnabled: false,
      licenseStatus: '',
      debugLog: '',
      lastWriteRequestId: '',
      isWriteInProgress: false,
      writeCompleted: false,
      initialCardSeriNo: '', // Bu da sıfırlanacak
    );

    _lastWriteStartTime = null;

    print(
      '✨ NFC Provider reset to initial state (including initialCardSeriNo)',
    );
  }

  String getWriteDebugInfo() {
    String info = 'WRITE DEBUG INFO:\n';
    info += 'Last Write Request ID: ${state.lastWriteRequestId}\n';
    info += 'Write Start Time: ${_lastWriteStartTime?.toString() ?? "None"}\n';
    info += 'Current Loading State: ${state.isLoading}\n';
    info += 'Write In Progress: ${state.isWriteInProgress}\n';
    info += 'Write Completed: ${state.writeCompleted}\n';
    info += 'Last Message: ${state.message}\n';
    info += 'NFC Enabled: ${state.isNfcEnabled}\n';
    info += 'License Status: ${state.licenseStatus}\n';
    info += 'Initial Card SeriNo: ${state.initialCardSeriNo}\n';
    info += 'Current Card SeriNo: ${state.cardData?.cardSeriNo ?? "None"}\n';
    info += 'Card Changed: ${isCardChanged()}\n';
    return info;
  }
}

// Provider tanımlaması
final nfcProvider = StateNotifierProvider<NFCNotifier, NFCState>((ref) {
  return NFCNotifier();
});
