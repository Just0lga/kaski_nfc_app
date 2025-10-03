import 'package:kaski_nfc_app/data/services/%20start_payment_service.dart';

class StartPaymentController {
  final StartPaymentService api = StartPaymentService();

  Future<bool> startPayment({
    String? merchantId,
    String? merchantPassword,
    String? pan,
    String? expiry,
    double? amount,
    String? currency,
    String? brand,
    String? successUrl,
    String? failureUrl,
  }) async {
    final result = await api.startPayment(
      merchantId: merchantId,
      merchantPassword: merchantPassword,
      pan: pan,
      expiry: expiry,
      amount: amount,
      currency: currency,
      brand: brand,
      successUrl: successUrl,
      failureUrl: failureUrl,
    );
    print("start payment: $result");
    return result;
  }
}
