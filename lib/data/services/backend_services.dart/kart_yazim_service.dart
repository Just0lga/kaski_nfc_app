import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kaski_nfc_app/core/constants/Env.dart';
import '../../models/backend_models/kart_yazim.dart';
import '../../models/backend_models/oturum_bilgileri.dart';

class KartYazimService {
  Future<KartYazimResponse?> kartYazim({
    required OturumBilgileri oturumBilgileri,
    String? odemeId,
    String? sonuc,
    int? paydeskKodu,
  }) async {
    final url = Uri.parse("${Env.apiUrl}/esayac/nfc/kartYazim");

    final request = KartYazimRequest(
      oturumBilgileri: oturumBilgileri,
      odemeId: odemeId,
      sonuc: sonuc,
      paydeskKodu: paydeskKodu,
    );

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(request.toJson()),
    );

    print("kart yazim response: ${response.body}");

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      return KartYazimResponse.fromJson(decoded);
    }

    return null;
  }
}
