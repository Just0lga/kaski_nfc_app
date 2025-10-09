import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kaski_nfc_app/core/constants/Env.dart';
import '../../models/backend_models/odeme_durum.dart';
import '../../models/backend_models/oturum_bilgileri.dart';

class OdemeDurumService {
  Future<OdemeDurumResponse?> odemeDurumKontrol({
    required OturumBilgileri oturumBilgileri,
    required String odemeId,
  }) async {
    final url = Uri.parse("${Env.apiUrl}/nfc/odemeDurum");

    final request = OdemeDurumRequest(
      oturumBilgileri: oturumBilgileri,
      odemeId: odemeId,
    );

    print("odeme durum request $request");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(request.toJson()),
    );

    print("odeme durum response: ${response.body}");

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      return OdemeDurumResponse.fromJson(decoded);
    }

    return null;
  }
}
