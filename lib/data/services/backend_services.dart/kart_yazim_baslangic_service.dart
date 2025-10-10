import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:kaski_nfc_app/core/constants/Env.dart';
import '../../models/backend_models/kart_yazim_baslangic.dart';
import '../../models/backend_models/oturum_bilgileri.dart';

class KartYazimBaslangicService {
  Future<KartYazimBaslangicResponse?> kartYazimBaslangic({
    required OturumBilgileri oturumBilgileri,
    String? odemeId,
  }) async {
    final url = Uri.parse("${Env.apiUrl}/esayac/nfc/kartYazimBaslangic");

    final request = KartYazimBaslangicRequest(
      oturumBilgileri: oturumBilgileri,
      odemeId: odemeId,
    );

    // ✅ Sertifika doğrulamasını devre dışı bırak (sadece test için)
    final httpClient = HttpClient()
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    final ioClient = IOClient(httpClient);

    final response = await ioClient.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(request.toJson()),
    );

    print("kart yazim response: ${response.body}");

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      return KartYazimBaslangicResponse.fromJson(decoded);
    }

    return null;
  }
}
