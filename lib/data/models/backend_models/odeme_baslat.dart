import 'package:freezed_annotation/freezed_annotation.dart';
import 'oturum_bilgileri.dart';
import 'kart_bilgileri.dart';

part 'odeme_baslat.freezed.dart';
part 'odeme_baslat.g.dart';

@freezed
class OdemeBaslatRequest with _$OdemeBaslatRequest {
  const factory OdemeBaslatRequest({
    required OturumBilgileri oturumBilgileri,
    String? islemBaslangicTarihi,
    int? paydeskKodu,
    KartBilgileri? kartBilgileri,
    String? odemeId,
  }) = _OdemeBaslatRequest;

  factory OdemeBaslatRequest.fromJson(Map<String, dynamic> json) =>
      _$OdemeBaslatRequestFromJson(json);
}

@freezed
class OdemeBaslatResponse with _$OdemeBaslatResponse {
  const factory OdemeBaslatResponse({
    String? hata,
    String? hataAciklama,
    String? odemeId,
    String? islemUrl,
  }) = _OdemeBaslatResponse;

  factory OdemeBaslatResponse.fromJson(Map<String, dynamic> json) =>
      _$OdemeBaslatResponseFromJson(json);
}
