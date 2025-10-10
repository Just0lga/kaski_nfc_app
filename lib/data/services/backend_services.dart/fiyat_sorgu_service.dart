import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:kaski_nfc_app/core/constants/Env.dart';
import '../../models/backend_models/fiyat_sorgu.dart';
import '../../models/backend_models/oturum_bilgileri.dart';

class FiyatSorguService {
  Future<FiyatSorguResponse?> getFiyatSorgu({
    required OturumBilgileri oturumBilgileri,
    int? aboneNo,
    int? sarf,
  }) async {
    final url = Uri.parse("${Env.apiUrl}/nfc/fiyatSorgu");

    final request = FiyatSorguRequest(
      oturumBilgileri: oturumBilgileri,
      aboneNo: aboneNo,
      sarf: sarf,
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

    print("fiyat sorgu response: ${response.body}");

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      return FiyatSorguResponse.fromJson(decoded);
    }

    return null;
  }
}
