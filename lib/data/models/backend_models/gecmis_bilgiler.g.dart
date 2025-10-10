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
  basBnkEntid: (json['basBnkEntid'] as num?)?.toInt(),
  basIslemTarihi: json['basIslemTarihi'] == null
      ? null
      : DateTime.parse(json['basIslemTarihi'] as String),
  basOdemeId: json['basOdemeId'] as String?,
  basPaydeskKodu: (json['basPaydeskKodu'] as num?)?.toInt(),
  basTon: (json['basTon'] as num?)?.toInt(),
  basTutar: (json['basTutar'] as num?)?.toDouble(),
  basUrl: json['basUrl'] as String?,
  guncellemeTarihi: json['guncellemeTarihi'] == null
      ? null
      : DateTime.parse(json['guncellemeTarihi'] as String),
  id: (json['id'] as num?)?.toInt(),
  kayitTarihi: json['kayitTarihi'] == null
      ? null
      : DateTime.parse(json['kayitTarihi'] as String),
  krtYazimBaslangicTarihi: json['krtYazimBaslangicTarihi'] == null
      ? null
      : DateTime.parse(json['krtYazimBaslangicTarihi'] as String),
  krtYazimTarihi: json['krtYazimTarihi'] == null
      ? null
      : DateTime.parse(json['krtYazimTarihi'] as String),
  kurumId: (json['kurumId'] as num?)?.toInt(),
  otrmAboneNo: (json['otrmAboneNo'] as num?)?.toInt(),
  otrmCihazId: json['otrmCihazId'] as String?,
  otrmCihazModel: json['otrmCihazModel'] as String?,
  otrmKartSeriNo: json['otrmKartSeriNo'] as String?,
  otrmOturumTarihi: json['otrmOturumTarihi'] == null
      ? null
      : DateTime.parse(json['otrmOturumTarihi'] as String),
  otrmSayfa: json['otrmSayfa'] as String?,
  otrmUygulamaVersiyonu: json['otrmUygulamaVersiyonu'] as String?,
  sncBanka: json['sncBanka'] as String?,
  sncBankaIslemTarihi: json['sncBankaIslemTarihi'] == null
      ? null
      : DateTime.parse(json['sncBankaIslemTarihi'] as String),
  sncEkys: json['sncEkys'] as String?,
  sncEkysErr: json['sncEkysErr'] as String?,
  sncEkysIslemTarihi: json['sncEkysIslemTarihi'] == null
      ? null
      : DateTime.parse(json['sncEkysIslemTarihi'] as String),
  sncEkysThkid: json['sncEkysThkid'] as String?,
);

Map<String, dynamic> _$$GecmisBilgilerResponseImplToJson(
  _$GecmisBilgilerResponseImpl instance,
) => <String, dynamic>{
  'basBnkEntid': instance.basBnkEntid,
  'basIslemTarihi': instance.basIslemTarihi?.toIso8601String(),
  'basOdemeId': instance.basOdemeId,
  'basPaydeskKodu': instance.basPaydeskKodu,
  'basTon': instance.basTon,
  'basTutar': instance.basTutar,
  'basUrl': instance.basUrl,
  'guncellemeTarihi': instance.guncellemeTarihi?.toIso8601String(),
  'id': instance.id,
  'kayitTarihi': instance.kayitTarihi?.toIso8601String(),
  'krtYazimBaslangicTarihi': instance.krtYazimBaslangicTarihi
      ?.toIso8601String(),
  'krtYazimTarihi': instance.krtYazimTarihi?.toIso8601String(),
  'kurumId': instance.kurumId,
  'otrmAboneNo': instance.otrmAboneNo,
  'otrmCihazId': instance.otrmCihazId,
  'otrmCihazModel': instance.otrmCihazModel,
  'otrmKartSeriNo': instance.otrmKartSeriNo,
  'otrmOturumTarihi': instance.otrmOturumTarihi?.toIso8601String(),
  'otrmSayfa': instance.otrmSayfa,
  'otrmUygulamaVersiyonu': instance.otrmUygulamaVersiyonu,
  'sncBanka': instance.sncBanka,
  'sncBankaIslemTarihi': instance.sncBankaIslemTarihi?.toIso8601String(),
  'sncEkys': instance.sncEkys,
  'sncEkysErr': instance.sncEkysErr,
  'sncEkysIslemTarihi': instance.sncEkysIslemTarihi?.toIso8601String(),
  'sncEkysThkid': instance.sncEkysThkid,
};
