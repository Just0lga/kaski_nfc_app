// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consumer_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsumerCardImpl _$$ConsumerCardImplFromJson(Map<String, dynamic> json) =>
    _$ConsumerCardImpl(
      mainCredit: (json['mainCredit'] as num?)?.toDouble(),
      reserveCredit: (json['reserveCredit'] as num?)?.toDouble(),
      criticalCreditLimit: (json['criticalCreditLimit'] as num?)?.toDouble(),
      cardId: json['cardId'] as String?,
      cardNumber: json['cardNumber'] as String?,
      cardSeriNo: json['cardSeriNo'] as String?,
      lastTransactionDate: json['lastTransactionDate'] == null
          ? null
          : DateTime.parse(json['lastTransactionDate'] as String),
      cardStatus: json['cardStatus'] as String?,
      customerName: json['customerName'] as String?,
      customerId: json['customerId'] as String?,
    );

Map<String, dynamic> _$$ConsumerCardImplToJson(_$ConsumerCardImpl instance) =>
    <String, dynamic>{
      'mainCredit': instance.mainCredit,
      'reserveCredit': instance.reserveCredit,
      'criticalCreditLimit': instance.criticalCreditLimit,
      'cardId': instance.cardId,
      'cardNumber': instance.cardNumber,
      'cardSeriNo': instance.cardSeriNo,
      'lastTransactionDate': instance.lastTransactionDate?.toIso8601String(),
      'cardStatus': instance.cardStatus,
      'customerName': instance.customerName,
      'customerId': instance.customerId,
    };
