import 'package:flutter/material.dart';
import 'package:kaski_nfc_app/pages/start_page.dart';
import 'package:provider/provider.dart';
import 'package:kaski_nfc_app/pages/sonuc_page.dart';
import '../providers/nfc_provider.dart';
import '../models/consumer_card_dto.dart';
import '../models/credit_request_dto.dart';
import '../models/enums.dart';

class KartaYukleme extends StatefulWidget {
  final ConsumerCardDTO cardData;
  final double tonMiktari;
  final double tutar;

  const KartaYukleme({
    super.key,
    required this.cardData,
    required this.tonMiktari,
    required this.tutar,
  });

  @override
  State<KartaYukleme> createState() => _KartaYuklemeState();
}

class _KartaYuklemeState extends State<KartaYukleme>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _pulseAnimation;
  bool _writeStarted = false;

  @override
  void initState() {
    super.initState();

    // Animasyon kontrolcüsü
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _pulseAnimation = Tween<double>(begin: 0.8, end: 1.1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.repeat(reverse: true);

    // NFC yazma işlemini başlat
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startCardWriting();
    });
  }

  void _startCardWriting() {
    if (!_writeStarted) {
      _writeStarted = true;
      final nfcProvider = Provider.of<NFCProvider>(context, listen: false);

      print('🔄 Starting card writing process...');
      print('📊 Current card data: ${widget.cardData.toString()}');
      print('💰 Amount to add: ${widget.tutar}');

      // Yeni kredi miktarını hesapla (mevcut + eklenen tutar)
      final currentCredit = widget.cardData.mainCredit ?? 0.0;
      final newCredit = currentCredit + widget.tutar;

      print(
        '💳 New credit will be: $newCredit (current: $currentCredit + amount: ${widget.tutar})',
      );

      // Kart yazma işlemi için request oluştur
      final creditRequest = CreditRequestDTO(
        credit: newCredit,
        reserveCreditLimit: widget.cardData.reserveCredit ?? 0.0,
        criticalCreditLimit: widget.cardData.criticalCreditLimit ?? 0.0,
        operationType: OperationType.setCredit, // Kredi set et
      );

      print('🚀 Starting write operation with: ${creditRequest.toString()}');

      // Yazma işlemini başlat
      nfcProvider.writeCard(creditRequest);
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(163, 221, 253, 1),
      appBar: AppBar(
        title: const Text(
          "Karta Yükleme",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Color.fromRGBO(68, 95, 116, 1),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.home, color: Color.fromRGBO(68, 95, 116, 1)),
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const StartPage()),
              (route) => false,
            );
          },
          tooltip: 'Ana Sayfa',
        ),
      ),
      body: Consumer<NFCProvider>(
        builder: (context, nfcProvider, child) {
          // Yazma işlemi başarılı olduğunda sonuç sayfasına geç
          if (!nfcProvider.isLoading &&
              nfcProvider.message.contains('success')) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (mounted) {
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
            });
          }

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Animasyonlu NFC ikonu
                AnimatedBuilder(
                  animation: _pulseAnimation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _pulseAnimation.value,
                      child: CircleAvatar(
                        backgroundColor: const Color.fromRGBO(
                          235,
                          254,
                          254,
                          1.0,
                        ),
                        radius: width * 0.2,
                        child: Icon(
                          Icons.nfc,
                          size: height * 0.11,
                          color: const Color.fromRGBO(68, 95, 116, 1),
                        ),
                      ),
                    );
                  },
                ),

                SizedBox(height: height * 0.04),

                // Ana mesaj
                Text(
                  nfcProvider.isLoading
                      ? "Kartınızı telefonunuza yaklaştırın"
                      : "Kart yazma işlemi tamamlanıyor...",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color.fromRGBO(235, 254, 254, 1.0),
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: height * 0.04),

                // Progress bar
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.15),
                  child: const LinearProgressIndicator(
                    backgroundColor: Color.fromRGBO(68, 95, 116, 1),
                    color: Color.fromRGBO(235, 254, 254, 1.0),
                  ),
                ),

                SizedBox(height: height * 0.02),

                // Durum metni
                Text(
                  nfcProvider.isLoading
                      ? "Su yükleniyor..."
                      : "İşlem tamamlanıyor...",
                  style: const TextStyle(
                    color: Color.fromRGBO(235, 254, 254, 1.0),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
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
                    border: Border.all(color: Colors.white.withOpacity(0.2)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Yüklenecek:",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
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
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
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

                SizedBox(height: height * 0.02),

                // Hata mesajı varsa göster
                if (nfcProvider.message.isNotEmpty &&
                    !nfcProvider.message.contains('success') &&
                    !nfcProvider.message.contains('Writing') &&
                    !nfcProvider.message.contains('writing'))
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: width * 0.1),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.red.withOpacity(0.3)),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Yazma Hatası: ${nfcProvider.message}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                _writeStarted = false;
                                nfcProvider.clearMessage();
                                _startCardWriting();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: const Color.fromRGBO(
                                  163,
                                  221,
                                  253,
                                  1,
                                ),
                              ),
                              child: const Text("Tekrar Dene"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // Test için simüle edilmiş başarı mesajı gönder
                                nfcProvider.clearMessage();
                                // Başarılı sonuca geç
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SonucPage(
                                      cardData: widget.cardData,
                                      yuklenenMiktar: widget.tonMiktari,
                                      tutar: widget.tutar,
                                      yeniToplamBakiye:
                                          (widget.cardData.mainCredit ?? 0.0) +
                                          widget.tutar,
                                    ),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.white,
                              ),
                              child: const Text("Sim. Başarı"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                SizedBox(height: height * 0.1),
              ],
            ),
          );
        },
      ),
    );
  }
}
