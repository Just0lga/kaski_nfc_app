import 'package:freezed_annotation/freezed_annotation.dart';

part 'consumer_card.freezed.dart';
part 'consumer_card.g.dart';

@freezed
class ConsumerCard with _$ConsumerCard {
  const factory ConsumerCard({
    double? mainCredit,
    double? reserveCredit,
    double? criticalCreditLimit,
    String? cardId,
    String? cardNumber,
    String? cardSeriNo,
    DateTime? lastTransactionDate,
    String? cardStatus,
    String? customerName,
    String? customerId,
    String? paydeskCode,
  }) = _ConsumerCard;

  factory ConsumerCard.fromJson(Map<String, dynamic> json) =>
      _$ConsumerCardFromJson(json);
}
