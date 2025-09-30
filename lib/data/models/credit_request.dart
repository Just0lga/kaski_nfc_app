import 'package:freezed_annotation/freezed_annotation.dart';
import 'enums.dart';

part 'credit_request.freezed.dart';
part 'credit_request.g.dart';

@freezed
class CreditRequest with _$CreditRequest {
  const factory CreditRequest({
    @Default(0.0) double credit,
    @Default(0.0) double reserveCreditLimit,
    @Default(0.0) double criticalCreditLimit,
    @Default(OperationType.none) OperationType operationType,
    String? requestId,
  }) = _CreditRequest;

  factory CreditRequest.fromJson(Map<String, dynamic> json) =>
      _$CreditRequestFromJson(json);
}
