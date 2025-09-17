import 'package:flutter/material.dart';
import 'package:kaski_nfc_app/pages/karta_yukleme_page.dart';
import '../models/consumer_card_dto.dart';

class OdemeKontroluPage extends StatefulWidget {
  final ConsumerCardDTO cardData;
  final double tonMiktari;
  final double tutar;

  const OdemeKontroluPage({
    super.key,
    required this.cardData,
    required this.tonMiktari,
    required this.tutar,
  });

  @override
  State<OdemeKontroluPage> createState() => _OdemeKontroluPageState();
}

class _OdemeKontroluPageState extends State<OdemeKontroluPage> {
  @override
  void initState() {
    print("xxx OdemeKontroluPage");
    super.initState();
    // Ödeme işlemi simülasyonu - 2 saniye sonra karta yükleme sayfasına geç
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => KartaYukleme(
              cardData: widget.cardData,
              tonMiktari: widget.tonMiktari,
              tutar: widget.tutar,
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(163, 221, 253, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: const Color.fromRGBO(235, 254, 254, 1.0),
              radius: width * 0.2,
              child: const Icon(
                Icons.credit_card,
                color: Color.fromRGBO(163, 221, 253, 1),
                size: 100,
              ),
            ),
            SizedBox(height: height * 0.04),

            const Text(
              "Ödeme yapılıyor, lütfen bekleyiniz...",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(235, 254, 254, 1.0),
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: height * 0.02),

            // Ödeme detayları
            Container(
              margin: EdgeInsets.symmetric(horizontal: width * 0.15),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white.withOpacity(0.2)),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Miktar:",
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                      Text(
                        "${widget.tonMiktari} ton",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Tutar:",
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                      Text(
                        "${widget.tutar.toStringAsFixed(0)} TL",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: height * 0.04),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.15),
              child: const LinearProgressIndicator(
                backgroundColor: Color.fromRGBO(68, 95, 116, 1),
                color: Color.fromRGBO(235, 254, 254, 1.0),
              ),
            ),

            SizedBox(height: height * 0.02),

            const Text(
              "Banka ile bağlantı kuruluyor...",
              style: TextStyle(
                color: Color.fromRGBO(235, 254, 254, 0.8),
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
