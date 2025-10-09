import 'package:kaski_nfc_app/data/models/backend_models/oturum_bilgileri.dart';
import 'package:kaski_nfc_app/data/services/backend_services.dart/kart_yazim_bitis_service.dart';

class KartYazimBitisController {
  final KartYazimBitisService api = KartYazimBitisService();

  Future<dynamic> kartYazimBitis(
    OturumBilgileri oturumBilgileri, {
    String? odemeId,
  }) async {
    final result = await api.kartYazimBitis(
      oturumBilgileri: oturumBilgileri,
      odemeId: odemeId,
    );
    print("kart yazim: $result");
    return result;
  }
}
