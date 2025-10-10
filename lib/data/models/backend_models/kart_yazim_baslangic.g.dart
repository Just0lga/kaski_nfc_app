// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kart_yazim_baslangic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KartYazimBaslangicRequestImpl _$$KartYazimBaslangicRequestImplFromJson(
  Map<String, dynamic> json,
) => _$KartYazimBaslangicRequestImpl(
  oturumBilgileri: OturumBilgileri.fromJson(
    json['oturumBilgileri'] as Map<String, dynamic>,
  ),
  odemeId: json['odemeId'] as String?,
);

Map<String, dynamic> _$$KartYazimBaslangicRequestImplToJson(
  _$KartYazimBaslangicRequestImpl instance,
) => <String, dynamic>{
  'oturumBilgileri': instance.oturumBilgileri,
  'odemeId': instance.odemeId,
};

_$KartYazimBaslangicResponseImpl _$$KartYazimBaslangicResponseImplFromJson(
  Map<String, dynamic> json,
) => _$KartYazimBaslangicResponseImpl(
  hata: json['hata'] as String?,
  hataAciklama: json['hataAciklama'] as String?,
);

Map<String, dynamic> _$$KartYazimBaslangicResponseImplToJson(
  _$KartYazimBaslangicResponseImpl instance,
) => <String, dynamic>{
  'hata': instance.hata,
  'hataAciklama': instance.hataAciklama,
};
