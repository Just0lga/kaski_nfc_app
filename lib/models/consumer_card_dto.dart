import 'package:json_annotation/json_annotation.dart';

part 'consumer_card_dto.g.dart';

@JsonSerializable()
class ConsumerCardDTO {
  final double? mainCredit;
  final double? reserveCredit;
  final double? criticalCreditLimit;
  final String? cardId;
  final String? cardNumber;
  final String? cardSeriNo;
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
    this.cardSeriNo,
    this.lastTransactionDate,
    this.cardStatus,
    this.customerName,
    this.customerId,
  });

  factory ConsumerCardDTO.fromJson(Map<String, dynamic> json) {
    print('🔄 Creating ConsumerCardDTO from JSON: $json');

    try {
      return ConsumerCardDTO(
        mainCredit: _safeParseDouble(json['mainCredit']),
        reserveCredit: _safeParseDouble(json['reserveCredit']),
        criticalCreditLimit: _safeParseDouble(json['criticalCreditLimit']),
        cardId: _safeParseString(json['cardId']),
        cardNumber: _safeParseString(json['cardNumber']),
        cardSeriNo: _safeParseString(json['cardSeriNo']),
        lastTransactionDate: _safeParseDateTime(json['lastTransactionDate']),
        cardStatus: _safeParseString(json['cardStatus']),
        customerName: _safeParseString(json['customerName']),
        customerId: _safeParseString(json['customerId']),
      );
    } catch (e) {
      print('❌ Error creating ConsumerCardDTO: $e');
      rethrow;
    }
  }

  static double? _safeParseDouble(dynamic value) {
    if (value == null) return null;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) {
      try {
        return double.parse(value);
      } catch (e) {
        print('⚠️ Could not parse double from string: $value');
        return null;
      }
    }
    print('⚠️ Unexpected type for double: ${value.runtimeType}');
    return null;
  }

  static String? _safeParseString(dynamic value) {
    if (value == null) return null;
    if (value is String) return value;
    return value.toString();
  }

  static DateTime? _safeParseDateTime(dynamic value) {
    if (value == null) return null;
    if (value is String) {
      if (value.isEmpty) return null;
      try {
        // ISO 8601 formatını dene
        return DateTime.parse(value);
      } catch (e) {
        try {
          // Başka formatları dene - basit tarih formatları
          if (value.contains('/')) {
            // MM/dd/yyyy formatı
            final parts = value.split('/');
            if (parts.length >= 3) {
              final month = int.tryParse(parts[0]);
              final day = int.tryParse(parts[1]);
              final year = int.tryParse(parts[2]);
              if (month != null && day != null && year != null) {
                return DateTime(year, month, day);
              }
            }
          }
          print('⚠️ Could not parse DateTime from string: $value');
          return null;
        } catch (e2) {
          print('⚠️ Could not parse DateTime from string: $value, error: $e2');
          return null;
        }
      }
    }
    print('⚠️ Unexpected type for DateTime: ${value.runtimeType}');
    return null;
  }

  Map<String, dynamic> toJson() => _$ConsumerCardDTOToJson(this);

  @override
  String toString() {
    return 'ConsumerCardDTO(mainCredit: $mainCredit, reserveCredit: $reserveCredit, '
        'criticalCreditLimit: $criticalCreditLimit, cardId: $cardId, '
        'cardNumber: $cardNumber, cardSeriNo: $cardSeriNo, lastTransactionDate: $lastTransactionDate, '
        'cardStatus: $cardStatus, customerName: $customerName, customerId: $customerId)';
  }
}
