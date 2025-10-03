// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gecmis_bilgiler.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GecmisBilgilerRequestImpl _$$GecmisBilgilerRequestImplFromJson(
  Map<String, dynamic> json,
) => _$GecmisBilgilerRequestImpl(
  oturumBilgileri: OturumBilgileri.fromJson(
    json['oturumBilgileri'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$$GecmisBilgilerRequestImplToJson(
  _$GecmisBilgilerRequestImpl instance,
) => <String, dynamic>{'oturumBilgileri': instance.oturumBilgileri};

_$GecmisBilgilerResponseImpl _$$GecmisBilgilerResponseImplFromJson(
  Map<String, dynamic> json,
) => _$GecmisBilgilerResponseImpl(
  hata: json['hata'] as String?,
  hataAciklama: json['hataAciklama'] as String?,
  odemeId: json['odemeId'] as String?,
  odemeBaslat: json['odemeBaslat'] as Map<String, dynamic>?,
  odemeSonuc: json['odemeSonuc'] as String?,
  kartyazimSonuc: json['kartyazimSonuc'] as String?,
);

Map<String, dynamic> _$$GecmisBilgilerResponseImplToJson(
  _$GecmisBilgilerResponseImpl instance,
) => <String, dynamic>{
  'hata': instance.hata,
  'hataAciklama': instance.hataAciklama,
  'odemeId': instance.odemeId,
  'odemeBaslat': instance.odemeBaslat,
  'odemeSonuc': instance.odemeSonuc,
  'kartyazimSonuc': instance.kartyazimSonuc,
};
