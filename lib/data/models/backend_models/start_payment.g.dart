// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StartPaymentRequestImpl _$$StartPaymentRequestImplFromJson(
  Map<String, dynamic> json,
) => _$StartPaymentRequestImpl(
  merchantId: json['merchantId'] as String?,
  merchantPassword: json['merchantPassword'] as String?,
  pan: json['pan'] as String?,
  expiry: json['expiry'] as String?,
  amount: (json['amount'] as num?)?.toDouble(),
  currency: json['currency'] as String?,
  brand: json['brand'] as String?,
  successUrl: json['successUrl'] as String?,
  failureUrl: json['failureUrl'] as String?,
);

Map<String, dynamic> _$$StartPaymentRequestImplToJson(
  _$StartPaymentRequestImpl instance,
) => <String, dynamic>{
  'merchantId': instance.merchantId,
  'merchantPassword': instance.merchantPassword,
  'pan': instance.pan,
  'expiry': instance.expiry,
  'amount': instance.amount,
  'currency': instance.currency,
  'brand': instance.brand,
  'successUrl': instance.successUrl,
  'failureUrl': instance.failureUrl,
};
