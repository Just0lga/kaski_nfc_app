import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaski_nfc_app/data/models/backend_models/gecmis_bilgiler.dart';
import 'package:kaski_nfc_app/data/models/backend_models/oturum_bilgileri.dart';
import 'package:kaski_nfc_app/data/models/frontend_models/consumer_card.dart';
import 'package:kaski_nfc_app/data/services/frontend_services.dart/device_service.dart';
import 'package:kaski_nfc_app/presentation/controllers/gecmis_bilgiler_controller.dart';
import 'package:kaski_nfc_app/presentation/pages/main_page.dart';
import 'package:kaski_nfc_app/presentation/providers/nfc_provider.dart';
import 'package:package_info_plus/package_info_plus.dart';

class OdemeGecmisiPage extends ConsumerStatefulWidget {
  final ConsumerCard cardData;

  const OdemeGecmisiPage({super.key, required this.cardData});

  @override
  ConsumerState<OdemeGecmisiPage> createState() => _OdemeGecmisiPageState();
}

class _OdemeGecmisiPageState extends ConsumerState<OdemeGecmisiPage> {
  final GecmisBilgilerController _gecmisBilgilerController =
      GecmisBilgilerController();
  List<GecmisBilgilerResponse>? _gecmisBilgilerResponse;

  bool _isLoading = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    print("odeme_gecmisi_page");
    _fetchOdemeGecmisi();
  }

  Future<void> _fetchOdemeGecmisi() async {
    try {
      setState(() {
        _isLoading = true;
        _errorMessage = null;
      });

      final deviceData = await DeviceService.getDeviceData();
      final packageInfo = await PackageInfo.fromPlatform();

      final oturumBilgileri = OturumBilgileri(
        oturumTarihi: DateTime.now().toIso8601String(),
        aboneNo: int.tryParse(widget.cardData.customerNo ?? "") ?? 0,
        kartSeriNo: widget.cardData.cardSeriNo,
        cihazId: deviceData['deviceId'],
        cihazModel: deviceData['model'],
        uygulamaVersiyonu: packageInfo.version,
        sayfa: 'OdemeGecmisiPage',
      );

      print("Ödeme Geçmişi isteniyor: ${oturumBilgileri.toJson()}");

      final response = await _gecmisBilgilerController.getGecmisBilgiler(
        oturumBilgileri,
      );

      if (mounted) {
        setState(() {
          _gecmisBilgilerResponse = response;
          _isLoading = false;

          if (response == null || response.isEmpty) {
            _errorMessage = 'Geçmiş ödeme bilgisi bulunamadı.';
          }
        });
      }
    } catch (e) {
      print("❌ Abone bilgisi alınırken hata: $e");
      if (mounted) {
        setState(() {
          _isLoading = false;
          _errorMessage = 'Abone bilgileri yüklenirken bir hata oluştu';
        });
      }
    }
  }

  void _returnToMainPage() {
    final nfcNotifier = ref.read(nfcProvider.notifier);
    print("🔄 Resetting NFC provider and returning to main page");
    nfcNotifier.resetToInitialState();
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const MainPage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Color(0xFF0D47A1),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Ödeme Geçmişi",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.home, color: Colors.white),
          onPressed: _returnToMainPage,
          tooltip: 'Ana Sayfa',
        ),
      ),
      body: _isLoading
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF0D47A1).withOpacity(0.2),
                          blurRadius: 20,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: CircularProgressIndicator(
                      color: Color(0xFF0D47A1),
                      strokeWidth: 3,
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                  Text(
                    "Ödeme Geçmişi Yükleniyor",
                    style: TextStyle(
                      color: Color(0xFF0D47A1),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Lütfen bekleyiniz...",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            )
          : _errorMessage != null
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Container(
                  padding: EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.red.shade50,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.error_outline_rounded,
                          size: 56,
                          color: Colors.red.shade400,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        _errorMessage!,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[800],
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32),
                      ElevatedButton.icon(
                        onPressed: _fetchOdemeGecmisi,
                        icon: const Icon(Icons.refresh_rounded),
                        label: const Text("Tekrar Dene"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF0D47A1),
                          foregroundColor: Colors.white,
                          elevation: 2,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : _gecmisBilgilerResponse == null || _gecmisBilgilerResponse!.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.receipt_long_rounded,
                    size: 80,
                    color: Colors.grey[300],
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Henüz ödeme kaydı yok",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.04,
                vertical: height * 0.02,
              ),
              itemCount: _gecmisBilgilerResponse!.length,
              itemBuilder: (context, index) {
                final item = _gecmisBilgilerResponse![index];
                final bool isLoaded = item.krtYazimTarihi.toString() != "null";

                return Container(
                  margin: EdgeInsets.only(bottom: height * 0.015),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF0D47A1),
                        Color.fromARGB(255, 134, 179, 230),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF0D47A1).withOpacity(0.3),
                        blurRadius: 12,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.2),
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.payments_rounded,
                                          color: Colors.white,
                                          size: 24,
                                        ),
                                      ),
                                      SizedBox(width: 12),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Tutar",
                                              style: TextStyle(
                                                color: Colors.white.withOpacity(
                                                  0.9,
                                                ),
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            SizedBox(height: 2),
                                            Text(
                                              "${item.basTutar.toString()} ₺",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                letterSpacing: 0.5,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            Container(
                              height: 1,
                              color: Colors.white.withOpacity(0.2),
                            ),
                            SizedBox(height: 16),
                            Row(
                              children: [
                                Icon(
                                  Icons.water_drop_rounded,
                                  color: Colors.white.withOpacity(0.9),
                                  size: 20,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  "Su Miktarı: ",
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.9),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  "${item.basTon.toString()} m³",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: isLoaded
                                    ? Colors.green.withOpacity(0.25)
                                    : Colors.red.withOpacity(0.25),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: isLoaded
                                      ? Colors.greenAccent.withOpacity(0.5)
                                      : Colors.red.withOpacity(0.5),
                                  width: 1.5,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    isLoaded
                                        ? Icons.check_circle_rounded
                                        : Icons.pending_rounded,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    isLoaded
                                        ? "Karta Yüklendi"
                                        : "Karta Yükleme Yapılmadı",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
