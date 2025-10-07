// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'odeme_baslat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OdemeBaslatRequestImpl _$$OdemeBaslatRequestImplFromJson(
  Map<String, dynamic> json,
) => _$OdemeBaslatRequestImpl(
  oturumBilgileri: OturumBilgileri.fromJson(
    json['oturumBilgileri'] as Map<String, dynamic>,
  ),
  islemBaslangicTarihi: json['islemBaslangicTarihi'] as String?,
  paydeskKodu: (json['paydeskKodu'] as num?)?.toInt(),
  kartBilgileri: json['kartBilgileri'] == null
      ? null
      : KartBilgileri.fromJson(json['kartBilgileri'] as Map<String, dynamic>),
  odemeId: json['odemeId'] as String?,
);

Map<String, dynamic> _$$OdemeBaslatRequestImplToJson(
  _$OdemeBaslatRequestImpl instance,
) => <String, dynamic>{
  'oturumBilgileri': instance.oturumBilgileri,
  'islemBaslangicTarihi': instance.islemBaslangicTarihi,
  'paydeskKodu': instance.paydeskKodu,
  'kartBilgileri': instance.kartBilgileri,
  'odemeId': instance.odemeId,
};

_$OdemeBaslatResponseImpl _$$OdemeBaslatResponseImplFromJson(
  Map<String, dynamic> json,
) => _$OdemeBaslatResponseImpl(
  hata: json['hata'] as String?,
  hataAciklama: json['hataAciklama'] as String?,
  odemeId: json['odemeId'] as String?,
  islemUrl: json['islemUrl'] as String?,
);

Map<String, dynamic> _$$OdemeBaslatResponseImplToJson(
  _$OdemeBaslatResponseImpl instance,
) => <String, dynamic>{
  'hata': instance.hata,
  'hataAciklama': instance.hataAciklama,
  'odemeId': instance.odemeId,
  'islemUrl': instance.islemUrl,
};
