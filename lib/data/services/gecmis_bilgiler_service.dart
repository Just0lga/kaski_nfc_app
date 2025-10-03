import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kaski_nfc_app/core/constants/Env.dart';
import '../models/backend_models/gecmis_bilgiler.dart';
import '../models/backend_models/oturum_bilgileri.dart';

class GecmisBilgilerService {
  Future<GecmisBilgilerResponse?> getGecmisBilgiler({
    required OturumBilgileri oturumBilgileri,
  }) async {
    final url = Uri.parse("${Env.apiUrl}/esayac/nfc/gecmisBilgiler");

    final request = GecmisBilgilerRequest(oturumBilgileri: oturumBilgileri);

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(request.toJson()),
    );

    print("gecmis bilgiler response: ${response.body}");

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      return GecmisBilgilerResponse.fromJson(decoded);
    }

    return null;
  }
}
