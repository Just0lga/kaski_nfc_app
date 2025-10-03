import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kaski_nfc_app/core/constants/Env.dart';
import '../../models/backend_models/abone_bilgi.dart';
import '../../models/backend_models/oturum_bilgileri.dart';

class AboneBilgiService {
  Future<AboneBilgiResponse?> getAboneBilgi({
    required OturumBilgileri oturumBilgileri,
  }) async {
    final url = Uri.parse("${Env.apiUrl}/esayac/nfc/aboneBilgi");

    final request = AboneBilgiRequest(oturumBilgileri: oturumBilgileri);

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(request.toJson()),
    );

    print("abone bilgi response: ${response.body}");

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      return AboneBilgiResponse.fromJson(decoded);
    }

    return null;
  }
}
