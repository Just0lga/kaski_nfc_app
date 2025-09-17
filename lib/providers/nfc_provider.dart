import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import '../models/consumer_card_dto.dart';
import '../models/credit_request_dto.dart';
import '../models/enums.dart';
import 'package:uuid/uuid.dart';

class NFCProvider extends ChangeNotifier {
  static const platform = MethodChannel('com.example.kaski_nfc_app/methods');
  static const eventChannel = EventChannel('com.example.kaski_nfc_app/events');

  bool _isLoading = false;
  String _message = '';
  ConsumerCardDTO? _cardData;
  bool _isNfcEnabled = false;
  String _licenseStatus = '';

  bool get isLoading => _isLoading;
  String get message => _message;
  ConsumerCardDTO? get cardData => _cardData;
  bool get isNfcEnabled => _isNfcEnabled;
  String get licenseStatus => _licenseStatus;

  final _uuid = const Uuid();

  NFCProvider() {
    _initializeNFC();
    _listenToNFCEvents();
  }

  void _initializeNFC() async {
    try {
      await platform.invokeMethod('activateNFC');
      await _checkLicense();
    } catch (e) {
      _message = 'Failed to initialize NFC: $e';
      notifyListeners();
    }
  }

  void _listenToNFCEvents() {
    eventChannel.receiveBroadcastStream().listen(
      (dynamic event) {
        _handleNFCEvent(event);
      },
      onError: (dynamic error) {
        _message = 'NFC Event Error: $error';
        _isLoading = false;
        notifyListeners();
      },
    );
  }

  void _handleNFCEvent(dynamic event) {
    try {
      final Map<String, dynamic> eventData = Map<String, dynamic>.from(event);
      final String eventType = eventData['type'] ?? '';

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
          print('⚠️ Unknown event type: $eventType');
      }
    } catch (e) {
      print('❌ Error handling NFC event: $e');
      _message = 'Error processing NFC event: $e';
      _isLoading = false;
      notifyListeners();
    }
  }

  void _handleLicenseStatus(Map<String, dynamic> eventData) {
    final String? message = eventData['message'];
    _licenseStatus = message ?? 'Unknown license status';
    print('📄 License status updated: $_licenseStatus');
    notifyListeners();
  }

  void _handleOnResult(Map<String, dynamic> eventData) {
    final String? tag = eventData['tag'];
    final String? resultCode = eventData['code'];

    _message = tag ?? 'Unknown result';

    if (resultCode == 'CardReaded') {
      _isLoading = false;
    }

    print('🔄 OnResult - Tag: $tag, Code: $resultCode');
    notifyListeners();
  }

  void _handleReadCardResult(Map<String, dynamic> eventData) {
    _isLoading = false;
    final String? resultCode = eventData['code'];

    print('📖 Read card result - Code: $resultCode');

    if (resultCode == 'Success') {
      final dynamic cardDataRaw = eventData['cardData'];

      if (cardDataRaw != null) {
        try {
          // cardDataRaw'ı Map<String, dynamic> formatına çevir
          final Map<String, dynamic> cardDataMap = _safeConvertToMap(
            cardDataRaw,
          );

          print('🗺️ Safe card data map: $cardDataMap');

          // ConsumerCardDTO'ya çevir
          _cardData = ConsumerCardDTO.fromJson(cardDataMap);
          _message = 'Card read successfully';

          print('✅ Card data created successfully: $_cardData');
        } catch (e) {
          print('❌ Error converting card data: $e');
          _message = 'Error processing card data: $e';
          _cardData = null;
        }
      } else {
        print('⚠️ Card data is null');
        _message = 'Card data is empty';
        _cardData = null;
      }
    } else {
      _message = _getErrorMessage(resultCode);
      _cardData = null;
      print('❌ Card read failed: $resultCode');
    }

    notifyListeners();
  }

  void _handleWriteCardResult(Map<String, dynamic> eventData) {
    _isLoading = false;
    final String? resultCode = eventData['code'];

    if (resultCode == 'Success') {
      _message = 'Card written successfully';
      print('✅ Card write successful');
    } else {
      _message = _getErrorMessage(resultCode);
      print('❌ Card write failed: $resultCode');
    }

    notifyListeners();
  }

  void _handleError(Map<String, dynamic> eventData) {
    _isLoading = false;
    final String? errorMessage = eventData['message'];
    _message = errorMessage ?? 'Unknown error occurred';
    print('❌ Error event: $_message');
    notifyListeners();
  }

  Map<String, dynamic> _safeConvertToMap(dynamic data) {
    if (data is Map<String, dynamic>) {
      return data;
    } else if (data is Map) {
      // Diğer Map türlerini dönüştür
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
      // Diğer türler için string'e çevir
      return value.toString();
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
      final String licenseKey = "9283ebb4-9822-46fa-bbe3-ac4a4d25b8c2";
      final String requestId = _uuid.v4();

      final result = await platform.invokeMethod('getLicense', {
        'licenceKey': licenseKey,
        'requestId': requestId,
      });

      _licenseStatus = result['message'] ?? 'License checked';
      notifyListeners();
    } catch (e) {
      _licenseStatus = 'License check failed: $e';
      notifyListeners();
    }
  }

  Future<void> toggleNFC(bool enable) async {
    try {
      if (enable) {
        await platform.invokeMethod('activateNFC');
        _isNfcEnabled = true;
        _message = 'NFC Activated';
      } else {
        await platform.invokeMethod('disableNFC');
        _isNfcEnabled = false;
        _message = 'NFC Deactivated';
      }
      notifyListeners();
    } catch (e) {
      _message = 'NFC operation failed: $e';
      notifyListeners();
    }
  }

  Future<void> readCard() async {
    _isLoading = true;
    _message = 'Reading card...';
    _cardData = null;
    notifyListeners();

    try {
      final String requestId = _uuid.v4();
      await platform.invokeMethod('readCard', {'requestId': requestId});
      print('📖 Read card request sent with ID: $requestId');
    } catch (e) {
      _isLoading = false;
      _message = 'Failed to read card: $e';
      print('❌ Read card error: $e');
      notifyListeners();
    }
  }

  Future<void> writeCard(CreditRequestDTO creditRequest) async {
    _isLoading = true;
    _message = 'Writing card...';
    notifyListeners();

    try {
      creditRequest.requestId = _uuid.v4();

      // CreditRequestDTO'yu Map'e çevir ve enum'ları string'e dönüştür
      final Map<String, dynamic> requestMap = creditRequest.toJson();

      // OperationType enum'ını string'e çevir
      if (requestMap['operationType'] != null) {
        final operationType = creditRequest.operationType;
        String operationTypeString = '';

        switch (operationType) {
          case OperationType.none:
            operationTypeString = 'None';
            break;
          case OperationType.addCredit:
            operationTypeString = 'AddCredit';
            break;
          case OperationType.clearCredits:
            operationTypeString = 'ClearCredits';
            break;
          case OperationType.setCredit:
            operationTypeString = 'SetCredit';
            break;
        }

        requestMap['operationType'] = operationTypeString;
      }

      print('💳 Write card request: $requestMap');
      await platform.invokeMethod('writeCard', requestMap);
    } catch (e) {
      _isLoading = false;
      _message = 'Failed to write card: $e';
      print('❌ Write card error: $e');
      notifyListeners();
    }
  }

  Future<void> setUrl(String url) async {
    try {
      await platform.invokeMethod('setUrl', {'url': url});
    } catch (e) {
      _message = 'Failed to set URL: $e';
      notifyListeners();
    }
  }

  void clearMessage() {
    _message = '';
    notifyListeners();
  }
}
