import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:kaski_nfc_app/consumer_card_dto.dart';
import 'package:kaski_nfc_app/credit_request_dto.dart';
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
    final Map<String, dynamic> eventData = Map<String, dynamic>.from(event);
    final String eventType = eventData['type'] ?? '';

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
    }
  }

  void _handleLicenseStatus(Map<String, dynamic> eventData) {
    final String? message = eventData['message'];
    _licenseStatus = message ?? 'Unknown license status';
    notifyListeners();
  }

  void _handleOnResult(Map<String, dynamic> eventData) {
    final String? tag = eventData['tag'];
    final String? resultCode = eventData['code'];

    _message = tag ?? 'Unknown result';

    if (resultCode == 'CardReaded') {
      _isLoading = false;
    }

    notifyListeners();
  }

  void _handleReadCardResult(Map<String, dynamic> eventData) {
    _isLoading = false;
    final String? resultCode = eventData['code'];
    final Map<String, dynamic>? cardDataMap = eventData['cardData'];

    if (resultCode == 'Success' && cardDataMap != null) {
      _cardData = ConsumerCardDTO.fromJson(cardDataMap);
      _message = 'Card read successfully';
    } else {
      _message = _getErrorMessage(resultCode);
      _cardData = null;
    }

    notifyListeners();
  }

  void _handleWriteCardResult(Map<String, dynamic> eventData) {
    _isLoading = false;
    final String? resultCode = eventData['code'];

    if (resultCode == 'Success') {
      _message = 'Card written successfully';
    } else {
      _message = _getErrorMessage(resultCode);
    }

    notifyListeners();
  }

  String _getErrorMessage(String? resultCode) {
    switch (resultCode) {
      case 'CardNotReadYet':
        return 'Please read the card first!';
      case 'ReadCardAgain':
        return 'Please read the card again!';
      case 'Failed':
        return 'Operation failed!';
      default:
        return 'Unknown error: $resultCode';
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
    } catch (e) {
      _isLoading = false;
      _message = 'Failed to read card: $e';
      notifyListeners();
    }
  }

  Future<void> writeCard(CreditRequestDTO creditRequest) async {
    _isLoading = true;
    _message = 'Writing card...';
    notifyListeners();

    try {
      creditRequest.requestId = _uuid.v4();
      await platform.invokeMethod('writeCard', creditRequest.toJson());
    } catch (e) {
      _isLoading = false;
      _message = 'Failed to write card: $e';
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
