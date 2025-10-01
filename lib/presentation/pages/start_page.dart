import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kaski_nfc_app/presentation/pages/abone_bilgileri_page.dart';
import '../providers/nfc_provider.dart';

class StartPage extends ConsumerStatefulWidget {
  const StartPage({super.key});

  @override
  ConsumerState<StartPage> createState() => _StartPageState();
}

class _StartPageState extends ConsumerState<StartPage>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool _hasNavigated = false;

  @override
  void initState() {
    super.initState();
    print("xxx StartPage - initState called");

    _hasNavigated = false; // Reset navigation flag

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
      print("🔄 StartPage - PostFrameCallback called");

      final nfcNotifier = ref.read(nfcProvider.notifier);
      final currentState = ref.read(nfcProvider);

      print("📊 Current NFC state:");
      print(
        "  - cardData: ${currentState.cardData != null ? 'exists' : 'null'}",
      );
      print("  - isLoading: ${currentState.isLoading}");
      print("  - message: ${currentState.message}");

      // Eğer kart verisi varsa onu temizle ve yeniden başla
      if (currentState.cardData != null) {
        print("🧹 Found existing card data, clearing it");
        nfcNotifier.resetToInitialState();
      }

      // NFC'yi aktif et ve kart okumaya başla
      print("🔛 Activating NFC and starting card read");
      nfcNotifier.toggleNFC(true);

      Future.delayed(const Duration(milliseconds: 1000), () {
        if (mounted && !_hasNavigated) {
          print("📖 Starting card read operation");
          nfcNotifier.readCard();
        }
      });
    });
  }

  @override
  void dispose() {
    print("🧹 StartPage - dispose called");
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    // ref.watch ile state'i dinle
    final nfcState = ref.watch(nfcProvider);

    print('🔍 StartPage build - NFC State:');
    print('  - cardData: ${nfcState.cardData != null ? 'exists' : 'null'}');
    print('  - isLoading: ${nfcState.isLoading}');
    print('  - hasNavigated: $_hasNavigated');

    // Kart başarıyla okunduğunda abone bilgileri sayfasına geç
    // Sadece bir kez navigation yap
    if (nfcState.cardData != null &&
        !nfcState.isLoading &&
        !_hasNavigated &&
        mounted) {
      print('✅ Card data available, navigating to AboneBilgileriPage');
      _hasNavigated = true; // Navigation flag'ini set et

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  AboneBilgileriPage(cardData: nfcState.cardData!),
            ),
          );
        }
      });
    }

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
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
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      "assets/nfc_logo.svg",
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
            if (nfcState.isLoading)
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
            if (nfcState.message.isNotEmpty &&
                !nfcState.message.toLowerCase().contains('success') &&
                nfcState.cardData ==
                    null) // Sadece kart verisi yoksa hata göster
              Container(
                margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Text(
                      nfcState.message,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        if (!_hasNavigated) {
                          final notifier = ref.read(nfcProvider.notifier);
                          notifier.clearMessage();
                          notifier.readCard();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.blue,
                      ),
                      child: const Text("Tekrar Dene"),
                    ),
                  ],
                ),
              ),

            const SizedBox(height: 40),

            // License durumu
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                nfcState.licenseStatus.isNotEmpty
                    ? nfcState.licenseStatus
                    : "NFC Hazırlanıyor...",
                style: const TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ),

            // Debug bilgisi (geliştirme için)
            if (true) // Debug mode
              Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all(8),
                child: Text(
                  "Debug: hasNavigated=$_hasNavigated, cardData=${nfcState.cardData != null}",
                  style: const TextStyle(color: Colors.white70, fontSize: 10),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
