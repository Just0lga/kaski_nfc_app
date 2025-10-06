import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaski_nfc_app/data/models/frontend_models/consumer_card.dart';
import 'package:kaski_nfc_app/data/models/backend_models/oturum_bilgileri.dart';
import 'package:kaski_nfc_app/data/models/backend_models/abone_bilgi.dart';
import 'package:kaski_nfc_app/data/services/frontend_services.dart/device_service.dart';
import 'package:kaski_nfc_app/presentation/controllers/abone_bilgi_controller.dart';
import 'package:kaski_nfc_app/presentation/pages/main_page.dart';
import 'package:kaski_nfc_app/presentation/pages/miktar_girisi_page.dart';
import 'package:kaski_nfc_app/core/widgets/custom_button.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../providers/nfc_provider.dart';

class AboneBilgileriPage extends ConsumerStatefulWidget {
  final ConsumerCard cardData;

  const AboneBilgileriPage({super.key, required this.cardData});

  @override
  ConsumerState<AboneBilgileriPage> createState() => _AboneBilgileriPageState();
}

class _AboneBilgileriPageState extends ConsumerState<AboneBilgileriPage> {
  final AboneBilgiController _aboneBilgiController = AboneBilgiController();
  AboneBilgiResponse? _aboneBilgiResponse;
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    print("xxx AboneBilgileriPage");
    _fetchAboneBilgi();
  }

  Future<void> _fetchAboneBilgi() async {
    try {
      setState(() {
        _isLoading = true;
        _errorMessage = null;
      });

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
        sayfa: 'AboneBilgileriPage',
      );

      print("📤 Abone bilgisi isteniyor: ${oturumBilgileri.toJson()}");

      // API çağrısı yap
      final response = await _aboneBilgiController.getAboneBilgi(
        oturumBilgileri,
      );

      if (mounted) {
        setState(() {
          _aboneBilgiResponse = response;
          _isLoading = false;

          // Hata kontrolü
          if (response?.hata != null && response!.hata!.isNotEmpty) {
            _errorMessage = response.hataAciklama ?? 'Bir hata oluştu';
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

  Widget _buildInfoCard({
    required String title,
    required String value,
    required IconData icon,
    required Color iconColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Colors.grey.shade50],
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
        border: Border.all(color: Colors.grey.shade200, width: 1),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 24),
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
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Colors.black87,
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
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Abone Bilgileri",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.home, color: Colors.white),
          onPressed: _returnToMainPage,
          tooltip: 'Ana Sayfa',
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: _isLoading
                ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 16),
                        Text(
                          "Abone bilgileri yükleniyor...",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                  )
                : _errorMessage != null
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.error_outline,
                            size: 64,
                            color: Colors.red.shade300,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            _errorMessage!,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.red,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 24),
                          ElevatedButton.icon(
                            onPressed: _fetchAboneBilgi,
                            icon: const Icon(Icons.refresh),
                            label: const Text("Tekrar Dene"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        // Header Card
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF60BEF4), Color(0xFF2563EB)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF60BEF4).withOpacity(0.3),
                                spreadRadius: 0,
                                blurRadius: 20,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: const Icon(
                                  Icons.credit_card_rounded,
                                  color: Colors.white,
                                  size: 32,
                                ),
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                "Kart Bilgileri",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.5,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "Aşağıda kartınıza ait detayları görüntüleyebilirsiniz",
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),

                        Text("Paydesk Code: ${widget.cardData.paydeskCode}"),
                        _buildInfoCard(
                          title: "İSİM SOYİSİM",
                          value:
                              "${_aboneBilgiResponse?.ad ?? 'Sunucuya Ulaşılamıyor'} ${_aboneBilgiResponse?.soyad ?? ''}"
                                  .trim()
                                  .toUpperCase(),
                          icon: Icons.person_rounded,
                          iconColor: const Color(0xFF8B5CF6),
                        ),
                        _buildInfoCard(
                          title: "ABONE NO",
                          value: widget.cardData.customerNo ?? "34",
                          icon: Icons.numbers,
                          iconColor: const Color(0xFF10B981),
                        ),
                        // API'den gelen ad-soyad bilgisi
                        if (_aboneBilgiResponse != null &&
                            (_aboneBilgiResponse!.ad != null ||
                                _aboneBilgiResponse!.soyad != null))
                          _buildInfoCard(
                            title: "MEVCUT BAKİYE",
                            value:
                                "${widget.cardData.mainCredit?.toStringAsFixed(2) ?? "0.00"} TL/m³",
                            icon: Icons.account_balance_wallet_rounded,
                            iconColor: const Color(0xFFF59E0B),
                          ),
                      ],
                    ),
                  ),
          ),
          CustomButton(
            buttonText: "Devam et",
            buttonColor: Colors.blue,
            buttonOnTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      MiktarGirisiPage(cardData: widget.cardData),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
