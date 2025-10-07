import 'package:freezed_annotation/freezed_annotation.dart';
import 'oturum_bilgileri.dart';

part 'fiyat_sorgu.freezed.dart';
part 'fiyat_sorgu.g.dart';

@freezed
class FiyatSorguRequest with _$FiyatSorguRequest {
  const factory FiyatSorguRequest({
    required OturumBilgileri oturumBilgileri,
    int? aboneNo,
    int? sarf,
  }) = _FiyatSorguRequest;

  factory FiyatSorguRequest.fromJson(Map<String, dynamic> json) =>
      _$FiyatSorguRequestFromJson(json);
}

@freezed
class FiyatSorguResponse with _$FiyatSorguResponse {
  const factory FiyatSorguResponse({
    String? hata,
    String? hataAciklama,
    double? toplam,
    String? odemeId,
  }) = _FiyatSorguResponse;

  factory FiyatSorguResponse.fromJson(Map<String, dynamic> json) =>
      _$FiyatSorguResponseFromJson(json);
}
