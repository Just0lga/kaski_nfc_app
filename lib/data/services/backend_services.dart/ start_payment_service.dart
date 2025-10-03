import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kaski_nfc_app/core/constants/Env.dart';
import '../../models/backend_models/start_payment.dart';

class StartPaymentService {
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
    final url = Uri.parse("${Env.apiUrl}/esayac/payment/start");

    final request = StartPaymentRequest(
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

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(request.toJson()),
    );

    print("start payment response: ${response.body}");

    return response.statusCode == 200;
  }
}
