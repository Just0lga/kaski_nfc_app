// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kart_yazim.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KartYazimRequestImpl _$$KartYazimRequestImplFromJson(
  Map<String, dynamic> json,
) => _$KartYazimRequestImpl(
  oturumBilgileri: OturumBilgileri.fromJson(
    json['oturumBilgileri'] as Map<String, dynamic>,
  ),
  odemeId: json['odemeId'] as String?,
  sonuc: json['sonuc'] as String?,
  paydeskKodu: (json['paydeskKodu'] as num?)?.toInt(),
);

Map<String, dynamic> _$$KartYazimRequestImplToJson(
  _$KartYazimRequestImpl instance,
) => <String, dynamic>{
  'oturumBilgileri': instance.oturumBilgileri,
  'odemeId': instance.odemeId,
  'sonuc': instance.sonuc,
  'paydeskKodu': instance.paydeskKodu,
};

_$KartYazimResponseImpl _$$KartYazimResponseImplFromJson(
  Map<String, dynamic> json,
) => _$KartYazimResponseImpl(
  hata: json['hata'] as String?,
  hataAciklama: json['hataAciklama'] as String?,
);

Map<String, dynamic> _$$KartYazimResponseImplToJson(
  _$KartYazimResponseImpl instance,
) => <String, dynamic>{
  'hata': instance.hata,
  'hataAciklama': instance.hataAciklama,
};
