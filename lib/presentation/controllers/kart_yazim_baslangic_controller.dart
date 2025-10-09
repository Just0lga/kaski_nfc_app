import 'package:kaski_nfc_app/data/models/backend_models/oturum_bilgileri.dart';
import 'package:kaski_nfc_app/data/services/backend_services.dart/kart_yazim_baslangic_service.dart';

class KartYazimBaslangicController {
  final KartYazimBaslangicService api = KartYazimBaslangicService();

  Future<dynamic> kartYazimBaslangic(
    OturumBilgileri oturumBilgileri, {
    String? odemeId,
  }) async {
    final result = await api.kartYazimBaslangic(
      oturumBilgileri: oturumBilgileri,
      odemeId: odemeId,
    );
    print("kart yazim: $result");
    return result;
  }
}
