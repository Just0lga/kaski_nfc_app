import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kaski_nfc_app/core/constants/Env.dart';
import '../../models/backend_models/odeme_sonuc_kontrol.dart';
import '../../models/backend_models/oturum_bilgileri.dart';

class OdemeSonucKontrolService {
  Future<OdemeSonucKontrolResponse?> odemeSonucKontrol({
    required OturumBilgileri oturumBilgileri,
    String? odemeId,
    String? sonuc,
  }) async {
    final url = Uri.parse("${Env.apiUrl}/nfc/odemeSonucKontrol");

    final request = OdemeSonucKontrolRequest(
      oturumBilgileri: oturumBilgileri,
      odemeId: odemeId,
      sonuc: sonuc,
    );

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(request.toJson()),
    );

    print("odeme sonuc kontrol response: ${response.body}");

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      return OdemeSonucKontrolResponse.fromJson(decoded);
    }

    return null;
  }
}
