import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kaski_nfc_app/core/constants/Env.dart';
import '../../models/backend_models/abone_bilgi.dart';
import '../../models/backend_models/oturum_bilgileri.dart';

class AboneBilgiService {
  Future<AboneBilgiResponse?> getAboneBilgi({
    required OturumBilgileri oturumBilgileri,
  }) async {
    final url = Uri.parse("${Env.apiUrl}/nfc/aboneBilgi");

    final request = AboneBilgiRequest(oturumBilgileri: oturumBilgileri);

    print("📤 Request URL: $url");
    print("📤 Request Body: ${jsonEncode(request.toJson())}");

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(request.toJson()),
      );

      print("📥 Response Status Code: ${response.statusCode}");
      print("📥 Response Body: ${response.body}");

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        return AboneBilgiResponse.fromJson(decoded);
      } else {
        print("❌ API Error: Status ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("❌ Exception: $e");
      return null;
    }
  }
}
