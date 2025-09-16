// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreditRequestDTO _$CreditRequestDTOFromJson(
  Map<String, dynamic> json,
) => CreditRequestDTO(
  credit: (json['credit'] as num?)?.toDouble() ?? 0.0,
  reserveCreditLimit: (json['reserveCreditLimit'] as num?)?.toDouble() ?? 0.0,
  criticalCreditLimit: (json['criticalCreditLimit'] as num?)?.toDouble() ?? 0.0,
  operationType:
      $enumDecodeNullable(_$OperationTypeEnumMap, json['operationType']) ??
      OperationType.none,
  requestId: json['requestId'] as String?,
);

Map<String, dynamic> _$CreditRequestDTOToJson(CreditRequestDTO instance) =>
    <String, dynamic>{
      'credit': instance.credit,
      'reserveCreditLimit': instance.reserveCreditLimit,
      'criticalCreditLimit': instance.criticalCreditLimit,
      'operationType': _$OperationTypeEnumMap[instance.operationType]!,
      'requestId': instance.requestId,
    };

const _$OperationTypeEnumMap = {
  OperationType.none: 'None',
  OperationType.addCredit: 'AddCredit',
  OperationType.clearCredits: 'ClearCredits',
  OperationType.setCredit: 'SetCredit',
};
