import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kaski_nfc_app/core/constants/Env.dart';
import '../../models/backend_models/odeme_baslat.dart';
import '../../models/backend_models/oturum_bilgileri.dart';
import '../../models/backend_models/kart_bilgileri.dart';

class OdemeBaslatService {
  Future<OdemeBaslatResponse?> odemeBaslat({
    required OturumBilgileri oturumBilgileri,
    String? islemBaslangicTarihi,
    int? paydeskKodu,
    KartBilgileri? kartBilgileri,
    String? odemeId,
  }) async {
    final url = Uri.parse("${Env.apiUrl}/nfc/odemeBaslat");

    final request = OdemeBaslatRequest(
      oturumBilgileri: oturumBilgileri,
      islemBaslangicTarihi: islemBaslangicTarihi,
      paydeskKodu: paydeskKodu,
      kartBilgileri: kartBilgileri,
      odemeId: odemeId,
    );
    print("odeme baslat request: $request");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(request.toJson()),
    );

    print("odeme baslat response: ${response.body}");

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      return OdemeBaslatResponse.fromJson(decoded);
    }

    return null;
  }
}
