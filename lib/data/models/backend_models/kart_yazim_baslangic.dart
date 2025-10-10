import 'package:freezed_annotation/freezed_annotation.dart';
import 'oturum_bilgileri.dart';

part 'kart_yazim_baslangic.freezed.dart';
part 'kart_yazim_baslangic.g.dart';

@freezed
class KartYazimBaslangicRequest with _$KartYazimBaslangicRequest {
  const factory KartYazimBaslangicRequest({
    required OturumBilgileri oturumBilgileri,
    String? odemeId,
  }) = _KartYazimBaslangicRequest;

  factory KartYazimBaslangicRequest.fromJson(Map<String, dynamic> json) =>
      _$KartYazimBaslangicRequestFromJson(json);
}

@freezed
class KartYazimBaslangicResponse with _$KartYazimBaslangicResponse {
  const factory KartYazimBaslangicResponse({
    String? hata,
    String? hataAciklama,
  }) = _KartYazimBaslangicResponse;

  factory KartYazimBaslangicResponse.fromJson(Map<String, dynamic> json) =>
      _$KartYazimBaslangicResponseFromJson(json);
}
