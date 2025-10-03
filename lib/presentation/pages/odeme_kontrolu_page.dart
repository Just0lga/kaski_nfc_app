import 'package:flutter/material.dart';
import 'package:kaski_nfc_app/presentation/pages/karta_yukleme_page.dart';
import '../../data/models/frontend_models/consumer_card.dart';

class OdemeKontroluPage extends StatefulWidget {
  final ConsumerCard cardData;
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

class _OdemeKontroluPageState extends State<OdemeKontroluPage>
    with TickerProviderStateMixin {
  @override
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    print("xxx OdemeKontroluPage");
    super.initState();

    // Animasyon kontrolcüsü ekle
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.repeat(reverse: true);

    // Ödeme işlemi simülasyonu - 4 saniye sonra karta yükleme sayfasına geç
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
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _scaleAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _scaleAnimation.value,
                  child: Container(
                    width: width * 0.4,
                    height: width * 0.4,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.credit_card,
                      size: width * 0.2,
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: height * 0.04),

            const Text(
              "Ödeme yapılıyor, lütfen bekleyiniz...",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
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
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Miktar",
                        style: TextStyle(color: Colors.white, fontSize: 16),
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
                        "Tutar",
                        style: TextStyle(color: Colors.white, fontSize: 16),
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
                backgroundColor: Colors.blue,
                color: Color.fromRGBO(235, 254, 254, 1.0),
              ),
            ),

            SizedBox(height: height * 0.02),

            const Text(
              "Banka ile bağlantı kuruluyor...",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
