import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kaski_nfc_app/pages/abone_bilgileri_page.dart';
import '../providers/nfc_provider.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    print("xxx StartPage");
    // Animasyon kontrolcüsü
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.repeat(reverse: true);

    // NFC provider'ı dinle
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final nfcProvider = Provider.of<NFCProvider>(context, listen: false);

      // NFC'yi aktif et
      nfcProvider.toggleNFC(true);

      // Kart okuma işlemini başlat
      Future.delayed(const Duration(milliseconds: 500), () {
        nfcProvider.readCard();
      });
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
      backgroundColor: const Color.fromRGBO(96, 190, 244, 1.0),
      body: Consumer<NFCProvider>(
        builder: (context, nfcProvider, child) {
          // Kart başarıyla okunduğunda abone bilgileri sayfasına geç
          if (nfcProvider.cardData != null && !nfcProvider.isLoading) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      AboneBilgileriPage(cardData: nfcProvider.cardData!),
                ),
              );
            });
          }

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Animasyonlu NFC ikonu
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
                          Icons.nfc,
                          size: width * 0.2,
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 40),

                // Ana mesaj
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    "Kartı telefonun arka yüzüne yaklaştırın",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 28,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                const SizedBox(height: 20),

                // Durum mesajı
                if (nfcProvider.isLoading)
                  const Column(
                    children: [
                      CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                      SizedBox(height: 16),
                      Text(
                        "Kart okunuyor...",
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                    ],
                  ),

                // Hata mesajı varsa göster
                if (nfcProvider.message.isNotEmpty &&
                    !nfcProvider.message.contains('success'))
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.red.withOpacity(0.3)),
                    ),
                    child: Column(
                      children: [
                        Text(
                          nfcProvider.message,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {
                            nfcProvider.clearMessage();
                            nfcProvider.readCard();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: const Color.fromRGBO(
                              96,
                              190,
                              244,
                              1.0,
                            ),
                          ),
                          child: const Text("Tekrar Dene"),
                        ),
                      ],
                    ),
                  ),

                const SizedBox(height: 40),

                // License durumu
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    nfcProvider.licenseStatus.isNotEmpty
                        ? nfcProvider.licenseStatus
                        : "NFC Hazırlanıyor...",
                    style: const TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
