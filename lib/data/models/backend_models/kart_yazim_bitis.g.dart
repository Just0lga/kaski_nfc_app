// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kart_yazim_bitis.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KartYazimBitisRequestImpl _$$KartYazimBitisRequestImplFromJson(
  Map<String, dynamic> json,
) => _$KartYazimBitisRequestImpl(
  oturumBilgileri: OturumBilgileri.fromJson(
    json['oturumBilgileri'] as Map<String, dynamic>,
  ),
  odemeId: json['odemeId'] as String?,
);

Map<String, dynamic> _$$KartYazimBitisRequestImplToJson(
  _$KartYazimBitisRequestImpl instance,
) => <String, dynamic>{
  'oturumBilgileri': instance.oturumBilgileri,
  'odemeId': instance.odemeId,
};

_$KartYazimBitisResponseImpl _$$KartYazimBitisResponseImplFromJson(
  Map<String, dynamic> json,
) => _$KartYazimBitisResponseImpl(
  hata: json['hata'] as String?,
  hataAciklama: json['hataAciklama'] as String?,
);

Map<String, dynamic> _$$KartYazimBitisResponseImplToJson(
  _$KartYazimBitisResponseImpl instance,
) => <String, dynamic>{
  'hata': instance.hata,
  'hataAciklama': instance.hataAciklama,
};
