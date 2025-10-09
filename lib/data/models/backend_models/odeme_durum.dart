import 'package:freezed_annotation/freezed_annotation.dart';
import 'oturum_bilgileri.dart';

part 'odeme_durum.freezed.dart';
part 'odeme_durum.g.dart';

@freezed
class OdemeDurumRequest with _$OdemeDurumRequest {
  const factory OdemeDurumRequest({
    required OturumBilgileri oturumBilgileri,
    required String odemeId,
  }) = _OdemeDurumRequest;

  factory OdemeDurumRequest.fromJson(Map<String, dynamic> json) =>
      _$OdemeDurumRequestFromJson(json);
}

@freezed
class OdemeDurumResponse with _$OdemeDurumResponse {
  const factory OdemeDurumResponse({
    String? basIslemTarihi,
    String? basOdemeId,
    int? basPaydeskKodu,
    double? basTon,
    double? basTutar,
    String? guncellemeTarihi,
    int? id,
    String? kayitTarihi,
    int? kurumId,
    int? otrmAboneNo,
    String? otrmCihazId,
    String? otrmCihazModel,
    String? otrmKartSeriNo,
    String? otrmOturumTarihi,
    String? otrmSayfa,
    String? otrmUygulamaVersiyonu,
  }) = _OdemeDurumResponse;

  factory OdemeDurumResponse.fromJson(Map<String, dynamic> json) =>
      _$OdemeDurumResponseFromJson(json);
}
