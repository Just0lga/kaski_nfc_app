import 'package:freezed_annotation/freezed_annotation.dart';

part 'oturum_bilgileri.freezed.dart';
part 'oturum_bilgileri.g.dart';

@freezed
class OturumBilgileri with _$OturumBilgileri {
  const factory OturumBilgileri({
    String? oturumTarihi,
    int? aboneNo,
    String? kartSeriNo,
    String? cihazId,
    String? cihazModel,
    String? uygulamaVersiyonu,
    String? sayfa,
  }) = _OturumBilgileri;

  factory OturumBilgileri.fromJson(Map<String, dynamic> json) =>
      _$OturumBilgileriFromJson(json);
}
