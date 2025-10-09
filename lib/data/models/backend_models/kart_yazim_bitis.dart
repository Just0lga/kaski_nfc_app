import 'package:freezed_annotation/freezed_annotation.dart';
import 'oturum_bilgileri.dart';

part 'kart_yazim_bitis.freezed.dart';
part 'kart_yazim_bitis.g.dart';

@freezed
class KartYazimBitisRequest with _$KartYazimBitisRequest {
  const factory KartYazimBitisRequest({
    required OturumBilgileri oturumBilgileri,
    String? odemeId,
  }) = _KartYazimBitisRequest;

  factory KartYazimBitisRequest.fromJson(Map<String, dynamic> json) =>
      _$KartYazimBitisRequestFromJson(json);
}

@freezed
class KartYazimBitisResponse with _$KartYazimBitisResponse {
  const factory KartYazimBitisResponse({
    String? hata,
    String? hataAciklama,
    String? durum,
  }) = _KartYazimBitisResponse;

  factory KartYazimBitisResponse.fromJson(Map<String, dynamic> json) =>
      _$KartYazimBitisResponseFromJson(json);
}
