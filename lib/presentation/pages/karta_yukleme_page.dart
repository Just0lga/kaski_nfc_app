import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kaski_nfc_app/presentation/pages/start_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaski_nfc_app/presentation/pages/sonuc_page.dart';
import '../providers/nfc_provider.dart';
import '../../data/models/frontend_models/consumer_card.dart';
import '../../data/models/frontend_models/credit_request.dart';
import '../../data/models/frontend_models/enums.dart';

class KartaYukleme extends ConsumerStatefulWidget {
  final ConsumerCard cardData;
  final double tonMiktari;
  final double tutar;

  const KartaYukleme({
    super.key,
    required this.cardData,
    required this.tonMiktari,
    required this.tutar,
  });

  @override
  ConsumerState<KartaYukleme> createState() => _KartaYuklemeState();
}

class _KartaYuklemeState extends ConsumerState<KartaYukleme>
    with TickerProviderStateMixin {
  bool _writeStarted = false;
  bool _isNavigating = false;
  int _retryCount = 0;
  bool _cardValidated = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  @override
  void initState() {
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

    print("🏁 KartaYukleme initState");
    print("📊 Card data: ${widget.cardData}");
    print("💰 Amount: ${widget.tutar}");
    print("🏗️ Ton amount: ${widget.tonMiktari}");

    // NFC yazma işlemini başlat - 1 saniye gecikme ile
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 1), () {
        if (mounted) {
          _startCardWriting();
        }
      });
    });
  }

  void _startCardWriting() {
    if (!_writeStarted && mounted) {
      setState(() {
        _writeStarted = true;
        _cardValidated = false;
      });

      final nfcNotifier = ref.read(nfcProvider.notifier);

      print('🔄 Starting card writing process...');
      print('📊 Current card data: ${widget.cardData.toString()}');
      print('💰 Amount to add: ${widget.tutar}');
      print(
        '🔒 Initial card seri no: ${ref.read(nfcProvider).initialCardSeriNo}',
      );

      // Önce kart okuyarak doğruluğu kontrol et
      nfcNotifier.readCardBeforeWrite();
    }
  }

  void _proceedWithWrite() {
    setState(() {
      _cardValidated = true;
    });

    final nfcNotifier = ref.read(nfcProvider.notifier);

    // Yeni kredi miktarını hesapla (mevcut + eklenen tutar)
    final currentCredit = widget.cardData.mainCredit ?? 0.0;
    final newCredit = currentCredit + widget.tutar;

    print(
      '💳 New credit will be: $newCredit (current: $currentCredit + amount: ${widget.tutar})',
    );

    // Kart yazma işlemi için request oluştur
    final creditRequest = CreditRequest(
      credit: newCredit,
      reserveCreditLimit: widget.cardData.reserveCredit ?? 0.0,
      criticalCreditLimit: widget.cardData.criticalCreditLimit ?? 0.0,
      operationType: OperationType.setCredit,
    );

    print('🚀 Starting write operation with: ${creditRequest.toString()}');

    // Yazma işlemini başlat
    nfcNotifier.writeCard(creditRequest);
  }

  void _retryWriting() {
    _retryCount++;
    print('🔄 Retry attempt $_retryCount (unlimited retries)');

    setState(() {
      _writeStarted = false;
      _cardValidated = false;
    });

    final nfcNotifier = ref.read(nfcProvider.notifier);
    nfcNotifier.resetWriteState();
    nfcNotifier.clearMessage();

    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        _startCardWriting();
      }
    });
  }

  void _navigateToResult() {
    if (!_isNavigating && mounted) {
      _isNavigating = true;
      print('🔄 Navigating to result page...');

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SonucPage(
            cardData: widget.cardData,
            yuklenenMiktar: widget.tonMiktari,
            tutar: widget.tutar,
            yeniToplamBakiye:
                (widget.cardData.mainCredit ?? 0.0) + widget.tutar,
          ),
        ),
      );
    }
  }

  void _goBackToStartPage() {
    if (!_isNavigating && mounted) {
      _isNavigating = true;
      print('🏠 Going back to start page...');

      final nfcNotifier = ref.read(nfcProvider.notifier);
      nfcNotifier.resetToInitialState();

      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const StartPage()),
        (route) => false,
      );
    }
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

    final nfcState = ref.watch(nfcProvider);

    print('🔍 Consumer builder called');
    print('  - isLoading: ${nfcState.isLoading}');
    print('  - isWriteInProgress: ${nfcState.isWriteInProgress}');
    print('  - writeCompleted: ${nfcState.writeCompleted}');
    print('  - message: ${nfcState.message}');
    print('  - cardValidated: $_cardValidated');

    // Kart değişimi tespit edildi
    if (nfcState.message == 'DIFFERENT_CARD_DETECTED') {
      return _buildCardChangeWarningScreen(height, width);
    }

    // Kart okuma tamamlandıktan sonra write işlemine geç
    if (!nfcState.isLoading &&
        nfcState.cardData != null &&
        nfcState.message.contains('successfully') &&
        _writeStarted &&
        !_cardValidated &&
        !nfcState.isWriteInProgress &&
        !nfcState.writeCompleted &&
        !_isNavigating) {
      // Kart değişimi kontrolü - async olarak yap
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final nfcNotifier = ref.read(nfcProvider.notifier);
        if (nfcNotifier.isCardChanged()) {
          // Kart değişti, uyarı verilecek (yukarıda handle edilecek)
          print('🚨 Card changed detected, showing warning');
        } else {
          // Aynı kart, write işlemine devam et
          print('✅ Same card detected, proceeding with write');
          Future.delayed(const Duration(milliseconds: 500), () {
            if (mounted) {
              _proceedWithWrite();
            }
          });
        }
      });
    }

    // Write işlemi tamamlandığında - sadece başarılı olduğunda sonuç sayfasına git
    if (!nfcState.isLoading &&
        nfcState.writeCompleted &&
        (nfcState.message.toLowerCase().contains('success') ||
            nfcState.message.toLowerCase().contains('written')) &&
        !_isNavigating) {
      print('✅ Write completed successfully, waiting before navigation...');

      // PostFrameCallback ile navigation'ı güvenli hale getir
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Future.delayed(const Duration(seconds: 2), () {
          _navigateToResult();
        });
      });
    }

    return _buildMainScreen(height, width, nfcState);
  }

  Widget _buildCardChangeWarningScreen(double height, double width) {
    return Scaffold(
      backgroundColor: Colors.red[400],
      appBar: AppBar(
        title: const Text(
          "Kart Uyarısı",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red[600],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.home, color: Colors.white),
          onPressed: _goBackToStartPage,
          tooltip: 'Ana Sayfa',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Uyarı ikonu
            Icon(Icons.warning, size: width * 0.3, color: Colors.white),

            SizedBox(height: height * 0.04),

            // Uyarı mesajı
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.08),
              child: const Text(
                "FARKLI KART TESPİT EDİLDİ!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(height: height * 0.02),

            // Açıklama metni
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.1),
              child: const Text(
                "İlk okuduğunuz karttan farklı bir kart yaklaştırdınız. Güvenlik nedeniyle işlem durduruldu.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),

            SizedBox(height: height * 0.04),

            // Bilgi kutusu
            Container(
              margin: EdgeInsets.symmetric(horizontal: width * 0.08),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  const Text(
                    "Ne yapmalısınız:",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "1. İlk okuduğunuz kartı tekrar yaklaştırın\n2. Veya ana sayfaya dönerek baştan başlayın",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ),

            SizedBox(height: height * 0.06),

            // Butonlar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // Kartı tekrar oku ve kontrol et
                    setState(() {
                      _writeStarted = false;
                      _cardValidated = false;
                    });
                    final nfcNotifier = ref.read(nfcProvider.notifier);
                    nfcNotifier.clearMessage();
                    Future.delayed(const Duration(milliseconds: 500), () {
                      if (mounted) {
                        _startCardWriting();
                      }
                    });
                  },
                  icon: const Icon(Icons.refresh, size: 20),
                  label: const Text(
                    "Doğru Kartı Yaklaştır",
                    style: TextStyle(fontSize: 14),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.red[600],
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: _goBackToStartPage,
                  icon: const Icon(Icons.home, size: 20),
                  label: const Text(
                    "Ana Sayfa",
                    style: TextStyle(fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[600],
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMainScreen(double height, double width, NFCState nfcState) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height - 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // NFC ikonu
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

                SizedBox(height: height * 0.04),

                // Ana mesaj - duruma göre değişen
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: Text(
                    _getStatusMessage(nfcState),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                SizedBox(height: height * 0.04),

                // Progress bar
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.15),
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.blue,
                    color: const Color.fromRGBO(235, 254, 254, 1.0),
                    value: _getProgressValue(nfcState),
                  ),
                ),

                SizedBox(height: height * 0.02),

                // Durum metni
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                  child: Text(
                    _getSubStatusMessage(nfcState),
                    style: const TextStyle(
                      color: Color.fromRGBO(235, 254, 254, 1.0),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                SizedBox(height: height * 0.04),

                // İşlem detayları
                Container(
                  margin: EdgeInsets.symmetric(horizontal: width * 0.1),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Yüklenecek",
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

                      // Write tamamlandıysa başarı mesajı göster
                      if (nfcState.writeCompleted) ...[
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.check_circle,
                                color: Colors.white,
                                size: 20,
                              ),
                              SizedBox(width: 8),
                              Text(
                                "Yükleme Başarılı!",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],

                      // Retry counter göster
                      if (_retryCount > 0) ...[
                        const SizedBox(height: 8),
                        Text(
                          "Deneme: $_retryCount",
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),

                // Hata mesajı veya retry butonları - sadece retry butonu
                if (_shouldShowErrorSection(nfcState))
                  _buildErrorSection(nfcState),

                SizedBox(height: height * 0.05),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper metodlar

  String _getStatusMessage(NFCState nfcState) {
    if (!_writeStarted) {
      return "Karta yükleniyor...";
    } else if (!_cardValidated && nfcState.isLoading) {
      return "Kart kontrol ediliyor...";
    } else if (_cardValidated &&
        (nfcState.isWriteInProgress || nfcState.isLoading)) {
      return "Kartı yaklaştırın";
    } else if (nfcState.writeCompleted) {
      return "Yükleme Tamamlandı!";
    } else if (nfcState.message.toLowerCase().contains('again')) {
      return "Kartı tekrar yaklaştırın";
    } else if (nfcState.message.toLowerCase().contains('failed')) {
      return "Tekrar deneyiniz";
    } else {
      return "İşlem devam ediyor...";
    }
  }

  String _getSubStatusMessage(NFCState nfcState) {
    if (!_writeStarted) {
      return "İşlem başlatılıyor...";
    } else if (!_cardValidated && nfcState.isLoading) {
      return "Güvenlik kontrolü...";
    } else if (_cardValidated &&
        (nfcState.isWriteInProgress || nfcState.isLoading)) {
      return "Su yükleniyor...";
    } else if (nfcState.writeCompleted) {
      return "Sonuçlar hazırlanıyor...";
    } else if (nfcState.message.toLowerCase().contains('again')) {
      return "Kartı sabit tutun";
    } else {
      return "Lütfen bekleyin...";
    }
  }

  double? _getProgressValue(NFCState nfcState) {
    if (nfcState.writeCompleted) {
      return 1.0; // Sadece tamamlandığında %100
    } else {
      return null; // Diğer tüm durumlarda indeterminate (döner)
    }
  }

  bool _shouldShowErrorSection(NFCState nfcState) {
    return nfcState.message.isNotEmpty &&
        !nfcState.message.toLowerCase().contains('success') &&
        !nfcState.message.toLowerCase().contains('writing') &&
        !nfcState.message.toLowerCase().contains('written') &&
        !nfcState.message.toLowerCase().contains('validating') &&
        !nfcState.message.toLowerCase().contains('checking') &&
        nfcState.message != 'DIFFERENT_CARD_DETECTED' &&
        !nfcState.isLoading &&
        !nfcState.isWriteInProgress;
  }

  Widget _buildErrorSection(NFCState nfcState) {
    final isReadAgainError = nfcState.message.toLowerCase().contains('again');

    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          const SizedBox(height: 8),
          Text(
            isReadAgainError
                ? "Kartı arka yüze yaklaştırıp sabit tutun"
                : "Tekrar deneyiniz",
            style: const TextStyle(color: Colors.white, fontSize: 14),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 12),

          // Sadece retry butonu
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: ElevatedButton.icon(
              onPressed: _retryWriting,
              icon: const Icon(Icons.refresh, size: 16),
              label: Text(
                "Tekrar Dene",
                style: const TextStyle(fontSize: 14),
                overflow: TextOverflow.ellipsis,
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
              ),
            ),
          ),

          // Retry sayısını ayrı satırda göster
          if (_retryCount > 0) ...[
            const SizedBox(height: 6),
            Text(
              "Deneme: $_retryCount",
              style: const TextStyle(color: Colors.white70, fontSize: 11),
            ),
          ],
        ],
      ),
    );
  }
}
