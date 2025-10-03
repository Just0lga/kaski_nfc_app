import 'package:freezed_annotation/freezed_annotation.dart';
import 'oturum_bilgileri.dart';

part 'gecmis_bilgiler.freezed.dart';
part 'gecmis_bilgiler.g.dart';

@freezed
class GecmisBilgilerRequest with _$GecmisBilgilerRequest {
  const factory GecmisBilgilerRequest({
    required OturumBilgileri oturumBilgileri,
  }) = _GecmisBilgilerRequest;

  factory GecmisBilgilerRequest.fromJson(Map<String, dynamic> json) =>
      _$GecmisBilgilerRequestFromJson(json);
}

@freezed
class GecmisBilgilerResponse with _$GecmisBilgilerResponse {
  const factory GecmisBilgilerResponse({
    String? hata,
    String? hataAciklama,
    String? odemeId,
    Map<String, dynamic>? odemeBaslat,
    String? odemeSonuc,
    String? kartyazimSonuc,
  }) = _GecmisBilgilerResponse;

  factory GecmisBilgilerResponse.fromJson(Map<String, dynamic> json) =>
      _$GecmisBilgilerResponseFromJson(json);
}
