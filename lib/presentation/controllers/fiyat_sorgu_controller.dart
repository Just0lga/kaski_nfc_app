import 'package:kaski_nfc_app/data/models/backend_models/oturum_bilgileri.dart';
import 'package:kaski_nfc_app/data/services/fiyat_sorgu_service.dart';

class FiyatSorguController {
  final FiyatSorguService api = FiyatSorguService();

  Future<dynamic> getFiyatSorgu(
    OturumBilgileri oturumBilgileri, {
    int? aboneNo,
    int? sarf,
  }) async {
    final result = await api.getFiyatSorgu(
      oturumBilgileri: oturumBilgileri,
      aboneNo: aboneNo,
      sarf: sarf,
    );
    print("fiyat sorgu: $result");
    return result;
  }
}
