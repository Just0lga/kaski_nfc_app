import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:kaski_nfc_app/data/models/backend_models/kart_bilgileri.dart';
import 'package:kaski_nfc_app/data/models/backend_models/oturum_bilgileri.dart';
import 'package:kaski_nfc_app/data/services/frontend_services.dart/device_service.dart';
import 'package:kaski_nfc_app/presentation/controllers/odeme_baslat_controller.dart';
import 'package:kaski_nfc_app/presentation/pages/karta_yukleme_page.dart';
import 'package:kaski_nfc_app/core/widgets/custom_button.dart';
import 'package:kaski_nfc_app/presentation/pages/odeme_kontrolu_page.dart';
import 'package:kaski_nfc_app/presentation/pages/payment_web_view.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../data/models/frontend_models/consumer_card.dart';

class KartBilgileriPage extends StatefulWidget {
  final ConsumerCard cardData;
  final double tonMiktari;
  final double tutar;
  final String odemeId;

  const KartBilgileriPage({
    super.key,
    required this.cardData,
    required this.tonMiktari,
    required this.tutar,
    required this.odemeId,
  });

  @override
  State<KartBilgileriPage> createState() => _KartBilgileriPageState();
}

class _KartBilgileriPageState extends State<KartBilgileriPage> {
  final _formKey = GlobalKey<FormState>();
  final OdemeBaslatController _odemeBaslatController = OdemeBaslatController();

  // Credit Card Widget için değişkenler
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool _isProcessingPayment = false;

  final TextEditingController _kartNumarasiController = TextEditingController();
  final TextEditingController _isimController = TextEditingController();
  final TextEditingController _sonKullanmaController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  final FocusNode _kartFocus = FocusNode();
  final FocusNode _isimFocus = FocusNode();
  final FocusNode _sonKullanmaFocus = FocusNode();
  final FocusNode _cvvFocus = FocusNode();

  bool isKeyboardVisible(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom > 0;
  }

  @override
  void initState() {
    super.initState();
    print("xxx KartBilgileriPage");

    _kartNumarasiController.text = "4233444433330000";
    _isimController.text = "Tolga";
    _sonKullanmaController.text = "12/30";
    _cvvController.text = "333";

    cardNumber = _kartNumarasiController.text;
    expiryDate = _sonKullanmaController.text;
    cardHolderName = _isimController.text;
    cvvCode = _cvvController.text;

    _cvvFocus.addListener(() {
      setState(() {
        isCvvFocused = _cvvFocus.hasFocus;
      });
    });
  }

  Future<void> _startPaymentProcess() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isProcessingPayment = true;
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
        sayfa: 'KartBilgileriPage',
      );

      // KartBilgileri oluştur
      final kartBilgileri = KartBilgileri(
        kartNo: _kartNumarasiController.text.replaceAll(' ', ''),
        cvv: _cvvController.text,
        sonKullanimTarihi: _sonKullanmaController.text,
        adSoyad: _isimController.text.trim(),
      );

      print("📤 Ödeme başlatılıyor...");
      print("📊 Ton Miktarı: ${widget.tonMiktari}");
      print("💰 Tutar: ${widget.tutar}");

      // Ödeme başlatma isteği
      final response = await _odemeBaslatController.odemeBaslat(
        oturumBilgileri,
        islemBaslangicTarihi: DateTime.now().toIso8601String(),
        paydeskKodu: int.tryParse(widget.cardData.paydeskCode ?? "0") ?? 0,
        kartBilgileri: kartBilgileri,
        odemeId: widget.odemeId,
      );
      print("uıu $response");

      setState(() {
        _isProcessingPayment = false;
      });

      if (response != null) {
        // Hata kontrolü
        if (response.hata != null && response.hata!.isNotEmpty) {
          _showErrorDialog(
            response.hataAciklama ?? 'Ödeme başlatılırken hata oluştu',
          );
          return;
        }

        // 3D Secure URL'i al
        final String? islemUrl = response.islemUrl;
        final String? odemeId = response.odemeId;

        if (islemUrl == null || islemUrl.isEmpty) {
          _showErrorDialog('3D Secure URL alınamadı');
          return;
        }

        if (odemeId == null || odemeId.isEmpty) {
          _showErrorDialog('Ödeme ID alınamadı');
          return;
        }

        print("✅ 3D Secure URL alındı: $islemUrl");
        print("🆔 Ödeme ID: $odemeId");

        // 3D Secure sayfasını aç
        final result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                PaymentWebViewPage(paymentUrl: islemUrl, odemeId: odemeId),
          ),
        );

        // WebView'den dönen sonucu kontrol et
        if (result != null && result is Map<String, dynamic>) {
          _handlePaymentResult(result);
        } else {
          print("⚠️ WebView'den sonuç alınamadı");
          _showErrorDialog('Ödeme işlemi tamamlanamadı');
        }
      } else {
        _showErrorDialog('Ödeme başlatma isteği başarısız oldu');
      }
    } catch (e) {
      setState(() {
        _isProcessingPayment = false;
      });
      print("❌ Ödeme başlatma hatası: $e");
      _showErrorDialog('Ödeme işlemi sırasında beklenmeyen hata oluştu');
    }
  }

  // 🧪 TEST İÇİN: Doğrudan test HTML sayfasını aç
  Future<void> _startTestPayment() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    print("🧪 TEST MODU: Lokal HTML sayfası açılıyor");

    // Test için lokal HTML sayfasının URL'i
    // Kendi lokal sunucunuzun IP adresini buraya yazın
    const String testPaymentUrl =
        'https://just0lga.github.io/kaski-odeme-test/';
    const String testOdemeId = 'test-odeme-id-12345';

    // Test sayfasını aç
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaymentWebViewPage(
          paymentUrl: testPaymentUrl,
          odemeId: testOdemeId,
        ),
      ),
    );

    // WebView'den dönen sonucu kontrol et
    if (result != null && result is Map<String, dynamic>) {
      _handlePaymentResult(result);
    } else {
      print("⚠️ WebView'den sonuç alınamadı");
      _showErrorDialog('Ödeme işlemi tamamlanamadı');
    }
  }

  void _handlePaymentResult(Map<String, dynamic> result) {
    final bool success = result['success'] ?? false;
    final String odemeId = result['odemeId'] ?? '';
    final String message = result['message'] ?? '';

    print("📊 Payment result received:");
    print("  - Success: $success");
    print("  - Odeme ID: $odemeId");
    print("  - Message: $message");

    if (success) {
      // Ödeme başarılı - karta yükleme sayfasına geç
      print("✅ Payment successful, navigating to card loading page");

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => OdemeKontroluPage(
            cardData: widget.cardData,
            tonMiktari: widget.tonMiktari,
            tutar: widget.tutar,
            odemeId: widget.odemeId,
          ),
        ),
      );
    } else {
      // Ödeme başarısız
      print("❌ Payment failed");
      _showErrorDialog(message);
    }
  }

  void _showErrorDialog(String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Row(
            children: const [
              Icon(Icons.error_outline, color: Colors.red, size: 28),
              SizedBox(width: 8),
              Text(
                "Hata",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          content: Text(errorMessage, style: const TextStyle(fontSize: 16)),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "Tamam",
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

  // 🎯 Test veya Gerçek Ödeme Seçimi
  void _showPaymentModeDialog() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Row(
            children: const [
              Icon(Icons.payment, color: Color(0xFF0D47A1), size: 28),
              SizedBox(width: 8),
              Text(
                "Ödeme Modu",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Hangi ödeme modunu kullanmak istiyorsunuz?",
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 20),

              // Test Modu Butonu
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).pop();
                  _startTestPayment();
                },
                icon: const Icon(Icons.science, size: 24),
                label: const Text(
                  "Test Modu",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Gerçek Ödeme Butonu
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).pop();
                  _startPaymentProcess();
                },
                icon: const Icon(Icons.credit_card, size: 24),
                label: const Text(
                  "Gerçek Ödeme",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0D47A1),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "İptal",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _kartNumarasiController.dispose();
    _isimController.dispose();
    _sonKullanmaController.dispose();
    _cvvController.dispose();
    _kartFocus.dispose();
    _isimFocus.dispose();
    _sonKullanmaFocus.dispose();
    _cvvFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardOpen = isKeyboardVisible(context);
    const borderColor = Color(0xFF0D47A1);

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text(
          "Kart Bilgileri",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF0D47A1),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Text(
                widget.odemeId,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Ana içerik
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 16),

                        // Credit Card Widget
                        CreditCardWidget(
                          padding: 0,
                          cardBgColor: Colors.black,
                          cardNumber: cardNumber,
                          expiryDate: expiryDate,
                          cardHolderName: _turkishToEnglish(cardHolderName),
                          cvvCode: cvvCode,
                          showBackView: isCvvFocused,
                          obscureCardNumber: true,
                          obscureCardCvv: true,
                          isHolderNameVisible: true,
                          cardType: CardType.otherBrand,
                          onCreditCardWidgetChange: (CreditCardBrand brand) {},
                        ),

                        const SizedBox(height: 16),

                        // Form
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              // Kart Numarası
                              TextFormField(
                                controller: _kartNumarasiController,
                                focusNode: _kartFocus,
                                cursorColor: borderColor,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(16),
                                ],
                                decoration: InputDecoration(
                                  labelText: "Kart Numarası",
                                  labelStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 14,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: borderColor,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: borderColor,
                                      width: 2,
                                    ),
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.credit_card,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                ),
                                textInputAction: TextInputAction.next,
                                onChanged: (value) =>
                                    setState(() => cardNumber = value),
                                onFieldSubmitted: (_) => FocusScope.of(
                                  context,
                                ).requestFocus(_isimFocus),
                                validator: (value) {
                                  if (value == null ||
                                      value.isEmpty ||
                                      value.length != 16) {
                                    return "Geçerli kart numarasını giriniz";
                                  }
                                  return null;
                                },
                              ),

                              const SizedBox(height: 12),

                              // Kart Sahibi
                              TextFormField(
                                controller: _isimController,
                                focusNode: _isimFocus,
                                cursorColor: borderColor,
                                keyboardType: TextInputType.name,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                    RegExp(r'[a-zA-ZçÇğĞıİöÖşŞüÜ\s]'),
                                  ),
                                ],
                                decoration: InputDecoration(
                                  labelText: "Kart Sahibinin Adı",
                                  labelStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 14,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: borderColor,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: borderColor,
                                      width: 2,
                                    ),
                                  ),
                                ),
                                textInputAction: TextInputAction.next,
                                onChanged: (value) =>
                                    setState(() => cardHolderName = value),
                                onFieldSubmitted: (_) => FocusScope.of(
                                  context,
                                ).requestFocus(_sonKullanmaFocus),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Kart sahibinin adını giriniz";
                                  }
                                  return null;
                                },
                              ),

                              const SizedBox(height: 12),

                              // Son Kullanma Tarihi ve CVV
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: _sonKullanmaController,
                                      focusNode: _sonKullanmaFocus,
                                      cursorColor: borderColor,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                          RegExp(r'\d|/'),
                                        ),
                                        LengthLimitingTextInputFormatter(5),
                                        _ExpiryDateTextInputFormatter(),
                                      ],
                                      decoration: InputDecoration(
                                        labelText: "MM/YY",
                                        labelStyle: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                        ),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                              horizontal: 12,
                                              vertical: 14,
                                            ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          borderSide: const BorderSide(
                                            color: borderColor,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          borderSide: const BorderSide(
                                            color: borderColor,
                                            width: 2,
                                          ),
                                        ),
                                      ),
                                      textInputAction: TextInputAction.next,
                                      onChanged: (value) =>
                                          setState(() => expiryDate = value),
                                      onFieldSubmitted: (_) => FocusScope.of(
                                        context,
                                      ).requestFocus(_cvvFocus),
                                      validator: (value) {
                                        if (value == null ||
                                            !RegExp(
                                              r'^\d{2}/\d{2}$',
                                            ).hasMatch(value)) {
                                          return "MM/YY formatında giriniz";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),

                                  const SizedBox(width: 12),

                                  Expanded(
                                    child: TextFormField(
                                      controller: _cvvController,
                                      focusNode: _cvvFocus,
                                      cursorColor: borderColor,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        LengthLimitingTextInputFormatter(3),
                                      ],
                                      decoration: InputDecoration(
                                        labelText: "CVV",
                                        labelStyle: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                        ),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                              horizontal: 12,
                                              vertical: 14,
                                            ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          borderSide: const BorderSide(
                                            color: borderColor,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          borderSide: const BorderSide(
                                            color: borderColor,
                                            width: 2,
                                          ),
                                        ),
                                      ),
                                      textInputAction: TextInputAction.done,
                                      onChanged: (value) =>
                                          setState(() => cvvCode = value),
                                      validator: (value) {
                                        if (value == null ||
                                            value.length != 3) {
                                          return "Geçerli CVV giriniz";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 24),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Ödeme özeti kartı
              if (!keyboardOpen)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: Color(0xFF0D47A1).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Color(0xFF0D47A1).withOpacity(0.5),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Miktar",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "${widget.tonMiktari} ton",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Ödenecek Tutar",
                            style: TextStyle(
                              color: Color(0xFF0D47A1),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "${widget.tutar.toStringAsFixed(0)} TL",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: borderColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

              const SizedBox(height: 16),

              // Ödeme yap butonu - Test/Gerçek seçimi için
              if (!keyboardOpen)
                CustomButton(
                  buttonText: "Ödeme Yap",
                  buttonColor: borderColor,
                  buttonOnTap: _showPaymentModeDialog,
                ),
            ],
          ),

          // Loading Overlay
          if (_isProcessingPayment)
            Container(
              color: Colors.black.withOpacity(0.7),
              child: const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Ödeme işlemi başlatılıyor...",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

String _turkishToEnglish(String text) {
  return text
      .replaceAll('ç', 'c')
      .replaceAll('Ç', 'C')
      .replaceAll('ğ', 'g')
      .replaceAll('Ğ', 'G')
      .replaceAll('ı', 'i')
      .replaceAll('İ', 'I')
      .replaceAll('ö', 'o')
      .replaceAll('Ö', 'O')
      .replaceAll('ş', 's')
      .replaceAll('Ş', 'S')
      .replaceAll('ü', 'u')
      .replaceAll('Ü', 'U');
}

// Expiry date formatter
class _ExpiryDateTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String text = newValue.text;

    if (newValue.selection.baseOffset < oldValue.selection.baseOffset) {
      return newValue;
    }

    if (text.length == 2 && !text.contains('/')) {
      text = text + '/';
    }
    if (text.length > 5) {
      text = text.substring(0, 5);
    }

    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}
