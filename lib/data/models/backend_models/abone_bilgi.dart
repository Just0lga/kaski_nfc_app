import 'package:freezed_annotation/freezed_annotation.dart';
import 'oturum_bilgileri.dart';

part 'abone_bilgi.freezed.dart';
part 'abone_bilgi.g.dart';

@freezed
class AboneBilgiRequest with _$AboneBilgiRequest {
  const factory AboneBilgiRequest({required OturumBilgileri oturumBilgileri}) =
      _AboneBilgiRequest;

  factory AboneBilgiRequest.fromJson(Map<String, dynamic> json) =>
      _$AboneBilgiRequestFromJson(json);
}

@freezed
class AboneBilgiResponse with _$AboneBilgiResponse {
  const factory AboneBilgiResponse({
    String? hata,
    String? hataAciklama,
    String? ad,
    String? soyad,
  }) = _AboneBilgiResponse;

  factory AboneBilgiResponse.fromJson(Map<String, dynamic> json) =>
      _$AboneBilgiResponseFromJson(json);
}
