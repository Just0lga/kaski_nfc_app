import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kaski_nfc_app/core/constants/Env.dart';
import '../../models/backend_models/gecmis_bilgiler.dart';
import '../../models/backend_models/oturum_bilgileri.dart';

class GecmisBilgilerService {
  Future<List<GecmisBilgilerResponse>?> getGecmisBilgiler({
    required OturumBilgileri oturumBilgileri,
  }) async {
    final url = Uri.parse("${Env.apiUrl}/nfc/gecmisBilgiler");

    final request = GecmisBilgilerRequest(oturumBilgileri: oturumBilgileri);

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(request.toJson()),
    );

    print(
      "🟢 GecmisBilgiler response (${response.statusCode}): ${response.body}",
    );

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);

      // Gelen yanıt bir liste olduğu için map ile parse ediyoruz
      if (decoded is List) {
        return decoded.map((e) => GecmisBilgilerResponse.fromJson(e)).toList();
      } else {
        print("⚠️ Beklenmedik response formatı: ${decoded.runtimeType}");
      }
    } else {
      print("❌ Hata: ${response.statusCode} ${response.reasonPhrase}");
    }

    return null;
  }
}
