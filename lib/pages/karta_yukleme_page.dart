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

class _KartaYuklemeState extends State<KartaYukleme> {
  bool _writeStarted = false;
  bool _writeCompleted = false;
  bool _isNavigating = false; // Navigation guard

  @override
  void initState() {
    super.initState();
    print("xxx KartaYukleme initState");

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
          // Write işlemi tamamlandığında
          if (!nfcProvider.isLoading &&
              nfcProvider.message.contains('success') &&
              !_writeCompleted) {
            _writeCompleted = true;
            print('✅ Write completed, waiting before navigation...');

            // 2 saniye bekle sonra sonuç sayfasına geç
            Future.delayed(const Duration(seconds: 2), () {
              _navigateToResult();
            });
          }

          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height - 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // NFC ikonu
                    CircleAvatar(
                      backgroundColor: const Color.fromRGBO(235, 254, 254, 1.0),
                      radius: width * 0.2,
                      child: Icon(
                        Icons.nfc,
                        size: height * 0.11,
                        color: const Color.fromRGBO(68, 95, 116, 1),
                      ),
                    ),

                    SizedBox(height: height * 0.04),

                    // Ana mesaj - duruma göre değişen
                    Text(
                      _getStatusMessage(nfcProvider),
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
                      child: LinearProgressIndicator(
                        backgroundColor: const Color.fromRGBO(68, 95, 116, 1),
                        color: const Color.fromRGBO(235, 254, 254, 1.0),
                        value: _getProgressValue(),
                      ),
                    ),

                    SizedBox(height: height * 0.02),

                    // Durum metni
                    Text(
                      _getSubStatusMessage(nfcProvider),
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
                        border: Border.all(
                          color: Colors.white.withOpacity(0.2),
                        ),
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

                          // Write tamamlandıysa başarı mesajı göster
                          if (_writeCompleted) ...[
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
                        ],
                      ),
                    ),

                    SizedBox(height: height * 0.02),

                    // Hata mesajı varsa göster
                    if (nfcProvider.message.isNotEmpty &&
                        !nfcProvider.message.contains('success') &&
                        !nfcProvider.message.contains('Writing') &&
                        !nfcProvider.message.contains('writing') &&
                        !nfcProvider.message.contains('card...'))
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: width * 0.1),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.red.withOpacity(0.3),
                          ),
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
                                    _writeCompleted = false;
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
                                    _navigateToResult();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    foregroundColor: Colors.white,
                                  ),
                                  child: const Text("Geç"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                    SizedBox(height: height * 0.05),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  String _getStatusMessage(NFCProvider nfcProvider) {
    if (!_writeStarted) {
      return "Hazırlanıyor...";
    } else if (nfcProvider.isLoading) {
      return "Kartınızı telefonunuza yaklaştırın";
    } else if (_writeCompleted) {
      return "Yükleme Tamamlandı!";
    } else {
      return "Kart yazma işlemi tamamlanıyor...";
    }
  }

  String _getSubStatusMessage(NFCProvider nfcProvider) {
    if (!_writeStarted) {
      return "İşlem başlatılıyor...";
    } else if (nfcProvider.isLoading) {
      return "Su yükleniyor...";
    } else if (_writeCompleted) {
      return "Sonuçlar hazırlanıyor...";
    } else {
      return "İşlem tamamlanıyor...";
    }
  }

  double? _getProgressValue() {
    if (!_writeStarted) {
      return 0.2;
    } else if (_writeCompleted) {
      return 1.0;
    } else {
      return 0.6; // Sabit progress value
    }
  }
}
