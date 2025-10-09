import 'package:kaski_nfc_app/data/models/backend_models/oturum_bilgileri.dart';
import 'package:kaski_nfc_app/data/services/backend_services.dart/odeme_durum_service.dart';

class OdemeDurumController {
  final OdemeDurumService api = OdemeDurumService();

  Future<dynamic> odemeDurumKontrol(
    OturumBilgileri oturumBilgileri, {
    required String odemeId,
  }) async {
    final result = await api.odemeDurumKontrol(
      oturumBilgileri: oturumBilgileri,
      odemeId: odemeId,
    );
    print("odeme durum kontrol: $result");
    return result;
  }
}
