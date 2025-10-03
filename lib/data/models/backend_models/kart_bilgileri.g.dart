// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kart_bilgileri.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KartBilgileriImpl _$$KartBilgileriImplFromJson(Map<String, dynamic> json) =>
    _$KartBilgileriImpl(
      kartNo: json['kartNo'] as String?,
      cvv: json['cvv'] as String?,
      sonKullanimTarihi: json['sonKullanimTarihi'] as String?,
      adSoyad: json['adSoyad'] as String?,
    );

Map<String, dynamic> _$$KartBilgileriImplToJson(_$KartBilgileriImpl instance) =>
    <String, dynamic>{
      'kartNo': instance.kartNo,
      'cvv': instance.cvv,
      'sonKullanimTarihi': instance.sonKullanimTarihi,
      'adSoyad': instance.adSoyad,
    };
