// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fiyat_sorgu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FiyatSorguRequestImpl _$$FiyatSorguRequestImplFromJson(
  Map<String, dynamic> json,
) => _$FiyatSorguRequestImpl(
  oturumBilgileri: OturumBilgileri.fromJson(
    json['oturumBilgileri'] as Map<String, dynamic>,
  ),
  aboneNo: (json['aboneNo'] as num?)?.toInt(),
  sarf: (json['sarf'] as num?)?.toInt(),
);

Map<String, dynamic> _$$FiyatSorguRequestImplToJson(
  _$FiyatSorguRequestImpl instance,
) => <String, dynamic>{
  'oturumBilgileri': instance.oturumBilgileri,
  'aboneNo': instance.aboneNo,
  'sarf': instance.sarf,
};

_$FiyatSorguResponseImpl _$$FiyatSorguResponseImplFromJson(
  Map<String, dynamic> json,
) => _$FiyatSorguResponseImpl(
  hata: json['hata'] as String?,
  hataAciklama: json['hataAciklama'] as String?,
  toplam: (json['toplam'] as num?)?.toDouble(),
  odemeId: json['odemeId'] as String?,
);

Map<String, dynamic> _$$FiyatSorguResponseImplToJson(
  _$FiyatSorguResponseImpl instance,
) => <String, dynamic>{
  'hata': instance.hata,
  'hataAciklama': instance.hataAciklama,
  'toplam': instance.toplam,
  'odemeId': instance.odemeId,
};
