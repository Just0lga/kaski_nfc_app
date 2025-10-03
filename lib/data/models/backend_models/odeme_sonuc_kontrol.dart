import 'package:freezed_annotation/freezed_annotation.dart';
import 'oturum_bilgileri.dart';

part 'odeme_sonuc_kontrol.freezed.dart';
part 'odeme_sonuc_kontrol.g.dart';

@freezed
class OdemeSonucKontrolRequest with _$OdemeSonucKontrolRequest {
  const factory OdemeSonucKontrolRequest({
    required OturumBilgileri oturumBilgileri,
    String? odemeId,
    String? sonuc,
  }) = _OdemeSonucKontrolRequest;

  factory OdemeSonucKontrolRequest.fromJson(Map<String, dynamic> json) =>
      _$OdemeSonucKontrolRequestFromJson(json);
}

@freezed
class OdemeSonucKontrolResponse with _$OdemeSonucKontrolResponse {
  const factory OdemeSonucKontrolResponse({
    String? hata,
    String? hataAciklama,
    String? sonuc,
  }) = _OdemeSonucKontrolResponse;

  factory OdemeSonucKontrolResponse.fromJson(Map<String, dynamic> json) =>
      _$OdemeSonucKontrolResponseFromJson(json);
}
