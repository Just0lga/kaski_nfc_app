import 'package:freezed_annotation/freezed_annotation.dart';

part 'kart_bilgileri.freezed.dart';
part 'kart_bilgileri.g.dart';

@freezed
class KartBilgileri with _$KartBilgileri {
  const factory KartBilgileri({
    String? kartNo,
    String? cvv,
    String? sonKullanimTarihi,
    String? adSoyad,
  }) = _KartBilgileri;

  factory KartBilgileri.fromJson(Map<String, dynamic> json) =>
      _$KartBilgileriFromJson(json);
}
