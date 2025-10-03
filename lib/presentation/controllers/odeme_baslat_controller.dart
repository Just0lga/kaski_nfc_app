import 'package:kaski_nfc_app/data/models/backend_models/kart_bilgileri.dart';
import 'package:kaski_nfc_app/data/models/backend_models/oturum_bilgileri.dart';
import 'package:kaski_nfc_app/data/services/odeme_baslat_service.dart';

class OdemeBaslatController {
  final OdemeBaslatService api = OdemeBaslatService();

  Future<dynamic> odemeBaslat(
    OturumBilgileri oturumBilgileri, {
    String? islemBaslangicTarihi,
    int? paydeskKodu,
    KartBilgileri? kartBilgileri,
    double? ton,
    double? tutar,
  }) async {
    final result = await api.odemeBaslat(
      oturumBilgileri: oturumBilgileri,
      islemBaslangicTarihi: islemBaslangicTarihi,
      paydeskKodu: paydeskKodu,
      kartBilgileri: kartBilgileri,
      ton: ton,
      tutar: tutar,
    );
    print("odeme baslat: $result");
    return result;
  }
}
