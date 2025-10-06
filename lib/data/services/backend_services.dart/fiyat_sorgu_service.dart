import 'dart:convert';
import 'package:http/http.dart' as http;
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

    final response = await http.post(
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
