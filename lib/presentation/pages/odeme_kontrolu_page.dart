import 'package:flutter/material.dart';
import 'package:kaski_nfc_app/data/models/backend_models/oturum_bilgileri.dart';
import 'package:kaski_nfc_app/data/services/frontend_services.dart/device_service.dart';
import 'package:kaski_nfc_app/presentation/controllers/odeme_sonuc_kontrol_controller.dart';
import 'package:kaski_nfc_app/presentation/pages/karta_yukleme_page.dart';
import 'package:kaski_nfc_app/presentation/pages/main_page.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../data/models/frontend_models/consumer_card.dart';

class OdemeKontroluPage extends StatefulWidget {
  final ConsumerCard cardData;
  final double tonMiktari;
  final double tutar;
  final String odemeId;

  const OdemeKontroluPage({
    super.key,
    required this.cardData,
    required this.tonMiktari,
    required this.tutar,
    required this.odemeId,
  });

  @override
  State<OdemeKontroluPage> createState() => _OdemeKontroluPageState();
}

class _OdemeKontroluPageState extends State<OdemeKontroluPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _pulseAnimation;

  bool _isCheckingPayment = true;
  bool _paymentSuccess = false;
  String? _errorMessage;
  int _retryCount = 0;

  @override
  void initState() {
    super.initState();
    print("xxx OdemeKontroluPage - initState");

    // Pulse animasyonu
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _pulseAnimation = Tween<double>(begin: 0.95, end: 1.05).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.repeat(reverse: true);

    // Ödeme sonucu kontrolü
    _checkPaymentResult();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _checkPaymentResult() async {
    setState(() {
      _isCheckingPayment = true;
      _errorMessage = null;
    });

    try {
      // Cihaz bilgilerini topla
      final deviceData = await DeviceService.getDeviceData();
      final packageInfo = await PackageInfo.fromPlatform();

      // Oturum bilgileri oluştur
      final oturumBilgileri = OturumBilgileri(
        oturumTarihi: DateTime.now().toIso8601String(),
        aboneNo: int.tryParse(widget.cardData.customerNo ?? "") ?? 0,
        kartSeriNo: widget.cardData.cardSeriNo,
        cihazId: deviceData['deviceId'],
        cihazModel: deviceData['model'],
        uygulamaVersiyonu: packageInfo.version,
        sayfa: 'OdemeKontroluPage',
      );

      print("📤 Ödeme sonucu kontrol ediliyor...");
      print("🆔 Odeme ID: ${widget.odemeId}");

      // API çağrısı
      final controller = OdemeSonucKontrolController();
      final response = await controller.odemeSonucKontrol(
        oturumBilgileri,
        odemeId: widget.odemeId,
      );

      if (!mounted) return;

      setState(() {
        _isCheckingPayment = false;
      });

      if (response != null) {
        // Hata kontrolü
        if (response.hata != null && response.hata!.isNotEmpty) {
          setState(() {
            _errorMessage = response.hataAciklama ?? 'Ödeme kontrolü başarısız';
            _paymentSuccess = false;
          });
          print("❌ Hata: ${response.hataAciklama}");
          return;
        }

        // Sonuç kontrolü
        if (response.sonuc == "OK") {
          setState(() {
            _paymentSuccess = true;
            _errorMessage = null;
          });
          print("✅ Ödeme başarılı!");
        } else {
          setState(() {
            _paymentSuccess = false;
            _errorMessage =
                'Ödeme onaylanmadı: ${response.sonuc ?? "Bilinmiyor"}';
          });
          print("⚠️ Ödeme sonucu: ${response.sonuc}");
        }
      } else {
        setState(() {
          _errorMessage = 'Sunucuya bağlanılamadı';
          _paymentSuccess = false;
        });
        print("❌ API yanıt vermedi");
      }
    } catch (e) {
      if (!mounted) return;

      setState(() {
        _isCheckingPayment = false;
        _errorMessage = 'Beklenmeyen bir hata oluştu';
        _paymentSuccess = false;
      });
      print("❌ Hata: $e");
    }
  }

  void _retryCheck() {
    setState(() {
      _retryCount++;
    });
    _checkPaymentResult();
  }

  void _navigateToCardLoading() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => KartaYukleme(
          cardData: widget.cardData,
          tonMiktari: widget.tonMiktari,
          tutar: widget.tutar,
          odemeId: widget.odemeId,
        ),
      ),
    );
  }

  void _navigateToHome() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const MainPage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          "Ödeme Kontrolü",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.home, color: Colors.white),
            onPressed: _navigateToHome,
            tooltip: 'Ana Sayfa',
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),

                // Ana durum göstergesi
                _buildStatusCard(size),

                const SizedBox(height: 24),

                // Ödeme detayları
                _buildPaymentDetails(size),

                const SizedBox(height: 24),

                // Aksiyon butonları
                _buildActionButtons(),

                const SizedBox(height: 16),

                // Retry sayacı (debug için)
                if (_retryCount > 0)
                  Center(
                    child: Text(
                      "Deneme sayısı: $_retryCount",
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatusCard(Size size) {
    Color cardColor;
    IconData iconData;
    String title;
    String subtitle;

    if (_isCheckingPayment) {
      cardColor = Colors.blue;
      iconData = Icons.hourglass_empty;
      title = "Kontrol Ediliyor";
      subtitle = "Ödeme durumunuz sorgulanıyor...";
    } else if (_paymentSuccess) {
      cardColor = Colors.green;
      iconData = Icons.check_circle_outline;
      title = "Ödeme Onaylandı";
      subtitle = "Karta yükleme işlemine geçebilirsiniz";
    } else {
      cardColor = Colors.red;
      iconData = Icons.error_outline;
      title = "Ödeme Onaylanamadı";
      subtitle = _errorMessage ?? "Bir sorun oluştu";
    }

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [cardColor, cardColor.withOpacity(0.8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: cardColor.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          // Animasyonlu ikon
          AnimatedBuilder(
            animation: _pulseAnimation,
            builder: (context, child) {
              return Transform.scale(
                scale: _isCheckingPayment ? _pulseAnimation.value : 1.0,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(iconData, size: 64, color: Colors.white),
                ),
              );
            },
          ),

          const SizedBox(height: 20),

          // Başlık
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 0.5,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 8),

          // Alt başlık
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withOpacity(0.9),
            ),
            textAlign: TextAlign.center,
          ),

          // Loading göstergesi
          if (_isCheckingPayment) ...[
            const SizedBox(height: 20),
            const SizedBox(
              width: 200,
              child: LinearProgressIndicator(
                backgroundColor: Colors.white24,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildPaymentDetails(Size size) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Başlık
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.receipt_long,
                  color: Colors.blue,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                "İşlem Detayları",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Detay satırları
          _buildDetailRow(
            "Yüklenecek Miktar",
            "${widget.tonMiktari} ton",
            Icons.water_drop,
            Colors.blue,
          ),
          const Divider(height: 24),
          _buildDetailRow(
            "Ödenecek Tutar",
            "${widget.tutar.toStringAsFixed(2)} TL",
            Icons.payments,
            Colors.green,
          ),
          const Divider(height: 24),
          _buildDetailRow(
            "Ödeme ID",
            widget.odemeId.length > 20
                ? "${widget.odemeId.substring(0, 20)}..."
                : widget.odemeId,
            Icons.tag,
            Colors.orange,
            isSmall: true,
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(
    String label,
    String value,
    IconData icon,
    Color color, {
    bool isSmall = false,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color, size: 20),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: isSmall ? 12 : 13,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: TextStyle(
                  fontSize: isSmall ? 12 : 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    if (_isCheckingPayment) {
      return const SizedBox.shrink();
    }

    if (_paymentSuccess) {
      // Başarılı - Yazma işlemine geç butonu
      return Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton.icon(
              onPressed: _navigateToCardLoading,
              icon: const Icon(Icons.nfc, size: 24),
              label: const Text(
                "Yazma İşlemine Geç",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
              ),
            ),
          ),
          const SizedBox(height: 12),
          TextButton(
            onPressed: _navigateToHome,
            child: const Text(
              "Ana Sayfaya Dön",
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      );
    } else {
      // Hata - Tekrar dene butonu
      return Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton.icon(
              onPressed: _retryCheck,
              icon: const Icon(Icons.refresh, size: 24),
              label: const Text(
                "Tekrar Kontrol Et",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: OutlinedButton.icon(
              onPressed: _navigateToHome,
              icon: const Icon(Icons.home, size: 24),
              label: const Text(
                "Ana Sayfaya Dön",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.blue,
                side: const BorderSide(color: Colors.blue, width: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      );
    }
  }
}
