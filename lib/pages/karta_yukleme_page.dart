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
  bool _isNavigating = false; // Navigation guard
  int _retryCount = 0;
  static const int MAX_RETRIES = 3;

  @override
  void initState() {
    super.initState();
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
      });

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

  void _retryWriting() {
    if (_retryCount >= MAX_RETRIES) {
      print('❌ Max retry count reached, navigating to result');
      _navigateToResult();
      return;
    }

    _retryCount++;
    print('🔄 Retry attempt $_retryCount/$MAX_RETRIES');

    setState(() {
      _writeStarted = false;
    });

    final nfcProvider = Provider.of<NFCProvider>(context, listen: false);
    nfcProvider.resetWriteState();
    nfcProvider.clearMessage();

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
          print('🔍 Consumer builder called');
          print('  - isLoading: ${nfcProvider.isLoading}');
          print('  - isWriteInProgress: ${nfcProvider.isWriteInProgress}');
          print('  - writeCompleted: ${nfcProvider.writeCompleted}');
          print('  - message: ${nfcProvider.message}');

          // Write işlemi tamamlandığında - success mesajına bak
          if (!nfcProvider.isLoading &&
              nfcProvider.writeCompleted &&
              (nfcProvider.message.toLowerCase().contains('success') ||
                  nfcProvider.message.toLowerCase().contains('written')) &&
              !_isNavigating) {
            print(
              '✅ Write completed successfully, waiting before navigation...',
            );

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
                        value: _getProgressValue(nfcProvider),
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
                          if (nfcProvider.writeCompleted) ...[
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
                              "Deneme: $_retryCount/$MAX_RETRIES",
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),

                    // Hata mesajı veya retry butonları
                    if (_shouldShowErrorSection(nfcProvider))
                      _buildErrorSection(nfcProvider),

                    SizedBox(height: height * 0.05),

                    // Debug bilgileri (development modunda)
                    if (true) // Debug mode check
                      _buildDebugSection(nfcProvider),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Helper metodlar

  String _getStatusMessage(NFCProvider nfcProvider) {
    if (!_writeStarted) {
      return "Hazırlanıyor...";
    } else if (nfcProvider.isWriteInProgress || nfcProvider.isLoading) {
      return "Kartınızı telefonunuza yaklaştırın";
    } else if (nfcProvider.writeCompleted) {
      return "Yükleme Tamamlandı!";
    } else if (nfcProvider.message.toLowerCase().contains('again')) {
      return "Kartı tekrar yaklaştırın";
    } else if (nfcProvider.message.toLowerCase().contains('failed')) {
      return "İşlem başarısız";
    } else {
      return "İşlem tamamlanıyor...";
    }
  }

  String _getSubStatusMessage(NFCProvider nfcProvider) {
    if (!_writeStarted) {
      return "İşlem başlatılıyor...";
    } else if (nfcProvider.isWriteInProgress || nfcProvider.isLoading) {
      return "Su yükleniyor...";
    } else if (nfcProvider.writeCompleted) {
      return "Sonuçlar hazırlanıyor...";
    } else if (nfcProvider.message.toLowerCase().contains('again')) {
      return "Kartı sabit tutun";
    } else {
      return "İşlem tamamlanıyor...";
    }
  }

  double? _getProgressValue(NFCProvider nfcProvider) {
    if (!_writeStarted) {
      return 0.2;
    } else if (nfcProvider.writeCompleted) {
      return 1.0;
    } else if (nfcProvider.isWriteInProgress || nfcProvider.isLoading) {
      return null; // Indeterminate progress
    } else {
      return 0.8;
    }
  }

  bool _shouldShowErrorSection(NFCProvider nfcProvider) {
    return nfcProvider.message.isNotEmpty &&
        !nfcProvider.message.toLowerCase().contains('success') &&
        !nfcProvider.message.toLowerCase().contains('writing') &&
        !nfcProvider.message.toLowerCase().contains('written') &&
        !nfcProvider.isLoading &&
        !nfcProvider.isWriteInProgress;
  }

  Widget _buildErrorSection(NFCProvider nfcProvider) {
    final isReadAgainError = nfcProvider.message.toLowerCase().contains(
      'again',
    );
    final canRetry = _retryCount < MAX_RETRIES;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.1,
      ),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.red.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Icon(
            isReadAgainError ? Icons.nfc : Icons.error,
            color: Colors.white,
            size: 24,
          ),
          const SizedBox(height: 8),
          Text(
            isReadAgainError
                ? "Kartı telefonunuzun arka yüzüne yaklaştırıp sabit tutun"
                : "Yazma Hatası: ${nfcProvider.message}",
            style: const TextStyle(color: Colors.white, fontSize: 14),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (canRetry)
                ElevatedButton.icon(
                  onPressed: _retryWriting,
                  icon: const Icon(Icons.refresh, size: 18),
                  label: Text("Tekrar Dene ($_retryCount/$MAX_RETRIES)"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color.fromRGBO(163, 221, 253, 1),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                  ),
                ),
              ElevatedButton.icon(
                onPressed: _navigateToResult,
                icon: const Icon(Icons.skip_next, size: 18),
                label: const Text("Geç"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDebugSection(NFCProvider nfcProvider) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.1,
      ),
      child: ExpansionTile(
        title: const Text(
          "Debug Info",
          style: TextStyle(color: Colors.white70, fontSize: 12),
        ),
        iconColor: Colors.white70,
        collapsedIconColor: Colors.white70,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Write Started: $_writeStarted",
                  style: const TextStyle(color: Colors.white70, fontSize: 10),
                ),
                Text(
                  "Retry Count: $_retryCount",
                  style: const TextStyle(color: Colors.white70, fontSize: 10),
                ),
                Text(
                  "Is Loading: ${nfcProvider.isLoading}",
                  style: const TextStyle(color: Colors.white70, fontSize: 10),
                ),
                Text(
                  "Write In Progress: ${nfcProvider.isWriteInProgress}",
                  style: const TextStyle(color: Colors.white70, fontSize: 10),
                ),
                Text(
                  "Write Completed: ${nfcProvider.writeCompleted}",
                  style: const TextStyle(color: Colors.white70, fontSize: 10),
                ),
                Text(
                  "Last Message: ${nfcProvider.message}",
                  style: const TextStyle(color: Colors.white70, fontSize: 10),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "Request ID: ${nfcProvider.lastWriteRequestId}",
                  style: const TextStyle(color: Colors.white70, fontSize: 10),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    print('🧹 KartaYukleme dispose called');
    super.dispose();
  }
}
