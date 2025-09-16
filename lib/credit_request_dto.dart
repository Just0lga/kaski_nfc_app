import 'package:json_annotation/json_annotation.dart';
import 'enums.dart';

part 'credit_request_dto.g.dart';

@JsonSerializable()
class CreditRequestDTO {
  double credit;
  double reserveCreditLimit;
  double criticalCreditLimit;
  OperationType operationType;
  String? requestId;

  CreditRequestDTO({
    this.credit = 0.0,
    this.reserveCreditLimit = 0.0,
    this.criticalCreditLimit = 0.0,
    this.operationType = OperationType.none,
    this.requestId,
  });

  factory CreditRequestDTO.fromJson(Map<String, dynamic> json) =>
      _$CreditRequestDTOFromJson(json);

  Map<String, dynamic> toJson() => _$CreditRequestDTOToJson(this);

  @override
  String toString() {
    return 'CreditRequestDTO(credit: $credit, reserveCreditLimit: $reserveCreditLimit, '
        'criticalCreditLimit: $criticalCreditLimit, operationType: $operationType, '
        'requestId: $requestId)';
  }
}
