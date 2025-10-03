import 'package:kaski_nfc_app/data/models/backend_models/oturum_bilgileri.dart';
import 'package:kaski_nfc_app/data/services/odeme_sonuc_kontrol_service.dart';

class OdemeSonucKontrolController {
  final OdemeSonucKontrolService api = OdemeSonucKontrolService();

  Future<dynamic> odemeSonucKontrol(
    OturumBilgileri oturumBilgileri, {
    String? odemeId,
    String? sonuc,
  }) async {
    final result = await api.odemeSonucKontrol(
      oturumBilgileri: oturumBilgileri,
      odemeId: odemeId,
      sonuc: sonuc,
    );
    print("odeme sonuc kontrol: $result");
    return result;
  }
}
