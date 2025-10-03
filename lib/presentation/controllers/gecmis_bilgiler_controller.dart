import 'package:kaski_nfc_app/data/models/backend_models/oturum_bilgileri.dart';
import 'package:kaski_nfc_app/data/services/gecmis_bilgiler_service.dart';

class GecmisBilgilerController {
  final GecmisBilgilerService api = GecmisBilgilerService();

  Future<dynamic> getGecmisBilgiler(OturumBilgileri oturumBilgileri) async {
    final result = await api.getGecmisBilgiler(
      oturumBilgileri: oturumBilgileri,
    );
    print("gecmis bilgiler: $result");
    return result;
  }
}
