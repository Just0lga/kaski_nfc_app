import 'package:kaski_nfc_app/data/models/backend_models/gecmis_bilgiler.dart';
import 'package:kaski_nfc_app/data/models/backend_models/oturum_bilgileri.dart';
import 'package:kaski_nfc_app/data/services/backend_services.dart/gecmis_bilgiler_service.dart';

class GecmisBilgilerController {
  final GecmisBilgilerService api = GecmisBilgilerService();

  Future<List<GecmisBilgilerResponse>?> getGecmisBilgiler(
    OturumBilgileri oturumBilgileri,
  ) async {
    final result = await api.getGecmisBilgiler(
      oturumBilgileri: oturumBilgileri,
    );

    if (result != null && result.isNotEmpty) {
      print("✅ ${result.length} adet geçmiş bilgi alındı.");
    } else {
      print("⚠️ Geçmiş bilgi bulunamadı veya hata oluştu.");
    }

    return result;
  }
}
