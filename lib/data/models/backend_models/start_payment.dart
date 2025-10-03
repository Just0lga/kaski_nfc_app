import 'package:freezed_annotation/freezed_annotation.dart';

part 'start_payment.freezed.dart';
part 'start_payment.g.dart';

@freezed
class StartPaymentRequest with _$StartPaymentRequest {
  const factory StartPaymentRequest({
    String? merchantId,
    String? merchantPassword,
    String? pan,
    String? expiry,
    double? amount,
    String? currency,
    String? brand,
    String? successUrl,
    String? failureUrl,
  }) = _StartPaymentRequest;

  factory StartPaymentRequest.fromJson(Map<String, dynamic> json) =>
      _$StartPaymentRequestFromJson(json);
}
