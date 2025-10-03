// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oturum_bilgileri.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OturumBilgileriImpl _$$OturumBilgileriImplFromJson(
  Map<String, dynamic> json,
) => _$OturumBilgileriImpl(
  oturumTarihi: json['oturumTarihi'] as String?,
  aboneNo: (json['aboneNo'] as num?)?.toInt(),
  kartSeriNo: json['kartSeriNo'] as String?,
  cihazId: json['cihazId'] as String?,
  cihazModel: json['cihazModel'] as String?,
  uygulamaVersiyonu: json['uygulamaVersiyonu'] as String?,
  sayfa: json['sayfa'] as String?,
);

Map<String, dynamic> _$$OturumBilgileriImplToJson(
  _$OturumBilgileriImpl instance,
) => <String, dynamic>{
  'oturumTarihi': instance.oturumTarihi,
  'aboneNo': instance.aboneNo,
  'kartSeriNo': instance.kartSeriNo,
  'cihazId': instance.cihazId,
  'cihazModel': instance.cihazModel,
  'uygulamaVersiyonu': instance.uygulamaVersiyonu,
  'sayfa': instance.sayfa,
};
