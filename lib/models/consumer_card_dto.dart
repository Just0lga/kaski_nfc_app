import 'package:json_annotation/json_annotation.dart';

part 'consumer_card_dto.g.dart';

@JsonSerializable()
class ConsumerCardDTO {
  final double? mainCredit;
  final double? reserveCredit;
  final double? criticalCreditLimit;
  final String? cardId;
  final String? cardNumber;
  final DateTime? lastTransactionDate;
  final String? cardStatus;
  final String? customerName;
  final String? customerId;

  const ConsumerCardDTO({
    this.mainCredit,
    this.reserveCredit,
    this.criticalCreditLimit,
    this.cardId,
    this.cardNumber,
    this.lastTransactionDate,
    this.cardStatus,
    this.customerName,
    this.customerId,
  });

  factory ConsumerCardDTO.fromJson(Map<String, dynamic> json) =>
      _$ConsumerCardDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ConsumerCardDTOToJson(this);

  @override
  String toString() {
    return 'ConsumerCardDTO(mainCredit: $mainCredit, reserveCredit: $reserveCredit, '
        'criticalCreditLimit: $criticalCreditLimit, cardId: $cardId, '
        'cardNumber: $cardNumber, lastTransactionDate: $lastTransactionDate, '
        'cardStatus: $cardStatus, customerName: $customerName, customerId: $customerId)';
  }
}
