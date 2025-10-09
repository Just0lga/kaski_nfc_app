// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'odeme_durum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OdemeDurumRequestImpl _$$OdemeDurumRequestImplFromJson(
  Map<String, dynamic> json,
) => _$OdemeDurumRequestImpl(
  oturumBilgileri: OturumBilgileri.fromJson(
    json['oturumBilgileri'] as Map<String, dynamic>,
  ),
  odemeId: json['odemeId'] as String,
);

Map<String, dynamic> _$$OdemeDurumRequestImplToJson(
  _$OdemeDurumRequestImpl instance,
) => <String, dynamic>{
  'oturumBilgileri': instance.oturumBilgileri,
  'odemeId': instance.odemeId,
};

_$OdemeDurumResponseImpl _$$OdemeDurumResponseImplFromJson(
  Map<String, dynamic> json,
) => _$OdemeDurumResponseImpl(
  basIslemTarihi: json['basIslemTarihi'] as String?,
  basOdemeId: json['basOdemeId'] as String?,
  basPaydeskKodu: (json['basPaydeskKodu'] as num?)?.toInt(),
  basTon: (json['basTon'] as num?)?.toDouble(),
  basTutar: (json['basTutar'] as num?)?.toDouble(),
  guncellemeTarihi: json['guncellemeTarihi'] as String?,
  id: (json['id'] as num?)?.toInt(),
  kayitTarihi: json['kayitTarihi'] as String?,
  kurumId: (json['kurumId'] as num?)?.toInt(),
  otrmAboneNo: (json['otrmAboneNo'] as num?)?.toInt(),
  otrmCihazId: json['otrmCihazId'] as String?,
  otrmCihazModel: json['otrmCihazModel'] as String?,
  otrmKartSeriNo: json['otrmKartSeriNo'] as String?,
  otrmOturumTarihi: json['otrmOturumTarihi'] as String?,
  otrmSayfa: json['otrmSayfa'] as String?,
  otrmUygulamaVersiyonu: json['otrmUygulamaVersiyonu'] as String?,
);

Map<String, dynamic> _$$OdemeDurumResponseImplToJson(
  _$OdemeDurumResponseImpl instance,
) => <String, dynamic>{
  'basIslemTarihi': instance.basIslemTarihi,
  'basOdemeId': instance.basOdemeId,
  'basPaydeskKodu': instance.basPaydeskKodu,
  'basTon': instance.basTon,
  'basTutar': instance.basTutar,
  'guncellemeTarihi': instance.guncellemeTarihi,
  'id': instance.id,
  'kayitTarihi': instance.kayitTarihi,
  'kurumId': instance.kurumId,
  'otrmAboneNo': instance.otrmAboneNo,
  'otrmCihazId': instance.otrmCihazId,
  'otrmCihazModel': instance.otrmCihazModel,
  'otrmKartSeriNo': instance.otrmKartSeriNo,
  'otrmOturumTarihi': instance.otrmOturumTarihi,
  'otrmSayfa': instance.otrmSayfa,
  'otrmUygulamaVersiyonu': instance.otrmUygulamaVersiyonu,
};
