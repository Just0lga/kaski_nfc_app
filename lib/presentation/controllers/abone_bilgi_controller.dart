import 'package:kaski_nfc_app/data/models/backend_models/oturum_bilgileri.dart';
import 'package:kaski_nfc_app/data/services/abone_bilgi_service.dart';

class AboneBilgiController {
  final AboneBilgiService api = AboneBilgiService();

  Future<dynamic> getAboneBilgi(OturumBilgileri oturumBilgileri) async {
    final result = await api.getAboneBilgi(oturumBilgileri: oturumBilgileri);
    print("abone bilgi: $result");
    return result;
  }
}
