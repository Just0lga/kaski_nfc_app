// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abone_bilgi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AboneBilgiRequestImpl _$$AboneBilgiRequestImplFromJson(
  Map<String, dynamic> json,
) => _$AboneBilgiRequestImpl(
  oturumBilgileri: OturumBilgileri.fromJson(
    json['oturumBilgileri'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$$AboneBilgiRequestImplToJson(
  _$AboneBilgiRequestImpl instance,
) => <String, dynamic>{'oturumBilgileri': instance.oturumBilgileri};

_$AboneBilgiResponseImpl _$$AboneBilgiResponseImplFromJson(
  Map<String, dynamic> json,
) => _$AboneBilgiResponseImpl(
  hata: json['hata'] as String?,
  hataAciklama: json['hataAciklama'] as String?,
  ad: json['ad'] as String?,
  soyad: json['soyad'] as String?,
);

Map<String, dynamic> _$$AboneBilgiResponseImplToJson(
  _$AboneBilgiResponseImpl instance,
) => <String, dynamic>{
  'hata': instance.hata,
  'hataAciklama': instance.hataAciklama,
  'ad': instance.ad,
  'soyad': instance.soyad,
};
