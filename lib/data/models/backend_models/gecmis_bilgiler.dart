import 'package:freezed_annotation/freezed_annotation.dart';
import 'oturum_bilgileri.dart';

part 'gecmis_bilgiler.freezed.dart';
part 'gecmis_bilgiler.g.dart';

/// 🟢 REQUEST MODEL
@freezed
class GecmisBilgilerRequest with _$GecmisBilgilerRequest {
  const factory GecmisBilgilerRequest({
    required OturumBilgileri oturumBilgileri,
  }) = _GecmisBilgilerRequest;

  factory GecmisBilgilerRequest.fromJson(Map<String, dynamic> json) =>
      _$GecmisBilgilerRequestFromJson(json);
}

/// 🟢 RESPONSE MODEL
@freezed
class GecmisBilgilerResponse with _$GecmisBilgilerResponse {
  const factory GecmisBilgilerResponse({
    int? basBnkEntid,
    DateTime? basIslemTarihi,
    String? basOdemeId,
    int? basPaydeskKodu,
    int? basTon,
    double? basTutar,
    String? basUrl,
    DateTime? guncellemeTarihi,
    int? id,
    DateTime? kayitTarihi,
    DateTime? krtYazimBaslangicTarihi,
    DateTime? krtYazimTarihi,
    int? kurumId,
    int? otrmAboneNo,
    String? otrmCihazId,
    String? otrmCihazModel,
    String? otrmKartSeriNo,
    DateTime? otrmOturumTarihi,
    String? otrmSayfa,
    String? otrmUygulamaVersiyonu,
    String? sncBanka,
    DateTime? sncBankaIslemTarihi,
    String? sncEkys,
    String? sncEkysErr,
    DateTime? sncEkysIslemTarihi,
    String? sncEkysThkid,
  }) = _GecmisBilgilerResponse;

  factory GecmisBilgilerResponse.fromJson(Map<String, dynamic> json) =>
      _$GecmisBilgilerResponseFromJson(json);
}
