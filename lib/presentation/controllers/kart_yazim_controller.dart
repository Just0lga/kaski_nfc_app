import 'package:kaski_nfc_app/data/models/backend_models/oturum_bilgileri.dart';
import 'package:kaski_nfc_app/data/services/kart_yazim_service.dart';

class KartYazimController {
  final KartYazimService api = KartYazimService();

  Future<dynamic> kartYazim(
    OturumBilgileri oturumBilgileri, {
    String? odemeId,
    String? sonuc,
    int? paydeskKodu,
  }) async {
    final result = await api.kartYazim(
      oturumBilgileri: oturumBilgileri,
      odemeId: odemeId,
      sonuc: sonuc,
      paydeskKodu: paydeskKodu,
    );
    print("kart yazim: $result");
    return result;
  }
}
