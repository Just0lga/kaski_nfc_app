// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'odeme_sonuc_kontrol.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OdemeSonucKontrolRequestImpl _$$OdemeSonucKontrolRequestImplFromJson(
  Map<String, dynamic> json,
) => _$OdemeSonucKontrolRequestImpl(
  oturumBilgileri: OturumBilgileri.fromJson(
    json['oturumBilgileri'] as Map<String, dynamic>,
  ),
  odemeId: json['odemeId'] as String?,
  sonuc: json['sonuc'] as String?,
);

Map<String, dynamic> _$$OdemeSonucKontrolRequestImplToJson(
  _$OdemeSonucKontrolRequestImpl instance,
) => <String, dynamic>{
  'oturumBilgileri': instance.oturumBilgileri,
  'odemeId': instance.odemeId,
  'sonuc': instance.sonuc,
};

_$OdemeSonucKontrolResponseImpl _$$OdemeSonucKontrolResponseImplFromJson(
  Map<String, dynamic> json,
) => _$OdemeSonucKontrolResponseImpl(
  hata: json['hata'] as String?,
  hataAciklama: json['hataAciklama'] as String?,
  sonuc: json['sonuc'] as String?,
);

Map<String, dynamic> _$$OdemeSonucKontrolResponseImplToJson(
  _$OdemeSonucKontrolResponseImpl instance,
) => <String, dynamic>{
  'hata': instance.hata,
  'hataAciklama': instance.hataAciklama,
  'sonuc': instance.sonuc,
};
