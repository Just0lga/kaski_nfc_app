import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kaski_nfc_app/data/models/backend_models/oturum_bilgileri.dart';
import 'package:kaski_nfc_app/data/services/frontend_services.dart/device_service.dart';
import 'package:kaski_nfc_app/presentation/controllers/fiyat_sorgu_controller.dart';
import 'package:kaski_nfc_app/presentation/pages/kart_bilgileri_page.dart';
import 'package:kaski_nfc_app/core/widgets/custom_button.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../data/models/frontend_models/consumer_card.dart';

class MiktarGirisiPage extends StatefulWidget {
  final ConsumerCard cardData;

  const MiktarGirisiPage({super.key, required this.cardData});

  @override
  State<MiktarGirisiPage> createState() => _MiktarGirisiPageState();
}

class _MiktarGirisiPageState extends State<MiktarGirisiPage> {
  double tonMiktari = 10.0;
  double tutar = 0.0;
  String odemeId = "";
  final TextEditingController _controller = TextEditingController();
  final FiyatSorguController _fiyatSorguController = FiyatSorguController();
  bool _isLoadingPrice = false;
  String? _priceErrorMessage;

  @override
  void initState() {
    print("xxx MiktarGirisiPage");
    super.initState();

    // İlk yükleme için fiyat sorgula
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchPrice();
    });
  }

  bool isKeyboardVisible(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom > 0;
  }

  // 🔄 Otomatik fiyat sorgulama
  Future<void> _fetchPrice() async {
    if (tonMiktari <= 0) {
      setState(() {
        tutar = 0.0;
        _priceErrorMessage = null;
      });
      return;
    }

    setState(() {
      _isLoadingPrice = true;
      _priceErrorMessage = null;
    });

    try {
      // Cihaz bilgilerini ve uygulama versiyonunu al
      final deviceData = await DeviceService.getDeviceData();
      final packageInfo = await PackageInfo.fromPlatform();

      // OturumBilgileri oluştur
      final oturumBilgileri = OturumBilgileri(
        oturumTarihi: DateTime.now().toIso8601String(),
        aboneNo: int.tryParse(widget.cardData.customerNo ?? "") ?? 0,
        kartSeriNo: widget.cardData.cardSeriNo,
        cihazId: deviceData['deviceId'],
        cihazModel: deviceData['model'],
        uygulamaVersiyonu: packageInfo.version,
        sayfa: 'MiktarGirisiPage',
      );

      print("📤 Fiyat sorgusu gönderiliyor: ${tonMiktari.toInt()} ton");

      // Fiyat sorgusunu yap
      final response = await _fiyatSorguController.getFiyatSorgu(
        oturumBilgileri,
        aboneNo: int.tryParse(widget.cardData.customerNo ?? "") ?? 0,
        sarf: tonMiktari.toInt(),
      );

      setState(() {
        _isLoadingPrice = false;
      });

      if (response != null) {
        // Hata kontrolü
        if (response.hata != null && response.hata!.isNotEmpty) {
          setState(() {
            _priceErrorMessage = response.hataAciklama ?? 'Fiyat alınamadı';
            tutar = 0.0;
          });
          return;
        }

        // Başarılı - tutar bilgisini al
        final double? toplamTutar = response.toplam;

        if (toplamTutar == null || toplamTutar <= 0) {
          setState(() {
            _priceErrorMessage = 'Geçersiz tutar bilgisi';
            tutar = 0.0;
          });
          return;
        }

        // Tutarı güncelle
        setState(() {
          tutar = toplamTutar;
          odemeId = response.odemeId;
          _priceErrorMessage = null;
        });

        print("✅ Fiyat güncellendi: $tutar TL");
      } else {
        setState(() {
          _priceErrorMessage = 'Fiyat sorgusu başarısız';
          tutar = 0.0;
        });
      }
    } catch (e) {
      setState(() {
        _isLoadingPrice = false;
        _priceErrorMessage = 'Fiyat sorgusu hatası';
        tutar = 0.0;
      });
      print("❌ Fiyat sorgusu hatası: $e");
    }
  }

  void _showTonDialog() {
    _controller.clear();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          title: const Text(
            "Ton Miktarı Girişi",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          content: TextField(
            controller: _controller,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
            ],
            decoration: InputDecoration(
              labelText: "Ton miktarı",
              hintText: "Örn: 5.5",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(
                  color: Color.fromRGBO(96, 190, 244, 1.0),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(
                  color: Color.fromRGBO(96, 190, 244, 1.0),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(
                  color: Color.fromRGBO(96, 190, 244, 1.0),
                  width: 2,
                ),
              ),
              labelStyle: const TextStyle(
                color: Color.fromRGBO(96, 190, 244, 1.0),
              ),
              suffixText: "ton",
              suffixStyle: const TextStyle(
                color: Color.fromRGBO(96, 190, 244, 1.0),
              ),
            ),
            autofocus: true,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "İptal",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                String input = _controller.text.trim();
                if (input.isNotEmpty) {
                  double? miktar = double.tryParse(input);
                  if (miktar != null && miktar > 0) {
                    setState(() {
                      tonMiktari = miktar;
                    });
                    Navigator.of(context).pop();

                    // 🔥 Ton değiştiğinde otomatik fiyat sorgula
                    _fetchPrice();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        behavior: SnackBarBehavior.floating,
                        content: Text("Lütfen geçerli bir miktar giriniz"),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      behavior: SnackBarBehavior.floating,
                      content: Text("Lütfen bir miktar giriniz"),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(96, 190, 244, 1.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: const Text(
                "Kaydet",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildInfoCard({
    required String title,
    required String value,
    required IconData icon,
    required Color iconColor,
    bool isLoading = false,
    bool isError = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            isError ? Colors.red.shade50 : Colors.white,
            isError ? Colors.red.shade50 : Colors.grey.shade50,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            spreadRadius: 0,
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: isError ? Colors.red.shade200 : Colors.grey.shade200,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: isLoading
                ? SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(iconColor),
                    ),
                  )
                : Icon(icon, color: iconColor, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.grey.shade600,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: isError ? Colors.red : Colors.black87,
                    letterSpacing: 0.2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final keyboardOpen = isKeyboardVisible(context);

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text(
          "Miktar Girişi",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF0D47A1),
        iconTheme: IconThemeData(color: Colors.white),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 16),

                      // Miktar seçim alanı
                      GestureDetector(
                        onTap: _showTonDialog,
                        child: Container(
                          width: width * 0.9,
                          height: height * 0.25,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xFF0D47A1).withOpacity(0.2),
                            border: Border.all(
                              color: Color(0xFF0D47A1).withOpacity(0.5),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: width * 0.04,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  tonMiktari > 0
                                      ? "${tonMiktari.toString()} ton seçildi"
                                      : "Kaç ton yüklemek istiyorsunuz?",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: tonMiktari > 0
                                        ? FontWeight.bold
                                        : FontWeight.w400,
                                    fontSize: 28,
                                    color: tonMiktari > 0
                                        ? Color(0xFF0D47A1)
                                        : Colors.black87,
                                  ),
                                ),
                                if (tonMiktari > 0)
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Text(
                                      "Değiştirmek için tıklayın",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF0D47A1),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 16),

                      // Mevcut bakiye göstergesi
                      _buildInfoCard(
                        title: "MEVCUT BAKİYE",
                        value:
                            "${widget.cardData.mainCredit?.toStringAsFixed(2) ?? "0.00"} TL/m³",
                        icon: Icons.payment_rounded,
                        iconColor: const Color(0xFF10B981),
                      ),

                      // Ödenecek tutar - Loading veya Hata durumu
                      if (_isLoadingPrice)
                        _buildInfoCard(
                          title: "ÖDENECEK TUTAR",
                          value: "Hesaplanıyor...",
                          icon: Icons.receipt_long_rounded,
                          iconColor: const Color(0xFF8B5CF6),
                          isLoading: true,
                        )
                      else if (_priceErrorMessage != null)
                        _buildInfoCard(
                          title: "ÖDENECEK TUTAR",
                          value: _priceErrorMessage!,
                          icon: Icons.error_outline,
                          iconColor: Colors.red,
                          isError: true,
                        )
                      else if (tutar > 0)
                        _buildInfoCard(
                          title: "ÖDENECEK TUTAR",
                          value: "${tutar.toStringAsFixed(2)} TL",
                          icon: Icons.receipt_long_rounded,
                          iconColor: const Color(0xFF8B5CF6),
                        ),

                      // Yükleme sonrası bakiye
                      if (tutar > 0 && _priceErrorMessage == null)
                        _buildInfoCard(
                          title: "YÜKLEME SONRASI BAKİYE",
                          value:
                              "${((widget.cardData.mainCredit ?? 0.0) + tutar).toStringAsFixed(2)} TL/m³",
                          icon: Icons.shopping_cart_checkout_rounded,
                          iconColor: const Color(0xFFF59E0B),
                        ),
                    ],
                  ),
                ),
              ),
            ),

            keyboardOpen
                ? const SizedBox()
                : CustomButton(
                    buttonText: "Ödemeye Geç",
                    buttonColor:
                        tutar > 0 &&
                            !_isLoadingPrice &&
                            _priceErrorMessage == null
                        ? Color(0xFF0D47A1)
                        : Colors.grey,
                    buttonOnTap: () {
                      if (tutar > 0 &&
                          !_isLoadingPrice &&
                          _priceErrorMessage == null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => KartBilgileriPage(
                              cardData: widget.cardData,
                              tonMiktari: tonMiktari,
                              tutar: tutar,
                              odemeId: odemeId,
                            ),
                          ),
                        );
                      } else if (_priceErrorMessage != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            behavior: SnackBarBehavior.floating,
                            content: Text(
                              "Fiyat bilgisi alınamadı. Lütfen tekrar deneyin.",
                            ),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            behavior: SnackBarBehavior.floating,
                            content: Text("Lütfen bir miktar giriniz"),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                  ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
