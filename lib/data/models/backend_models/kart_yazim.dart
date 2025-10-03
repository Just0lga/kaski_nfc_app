import 'package:freezed_annotation/freezed_annotation.dart';
import 'oturum_bilgileri.dart';

part 'kart_yazim.freezed.dart';
part 'kart_yazim.g.dart';

@freezed
class KartYazimRequest with _$KartYazimRequest {
  const factory KartYazimRequest({
    required OturumBilgileri oturumBilgileri,
    String? odemeId,
    String? sonuc,
    int? paydeskKodu,
  }) = _KartYazimRequest;

  factory KartYazimRequest.fromJson(Map<String, dynamic> json) =>
      _$KartYazimRequestFromJson(json);
}

@freezed
class KartYazimResponse with _$KartYazimResponse {
  const factory KartYazimResponse({String? hata, String? hataAciklama}) =
      _KartYazimResponse;

  factory KartYazimResponse.fromJson(Map<String, dynamic> json) =>
      _$KartYazimResponseFromJson(json);
}
