import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaski_nfc_app/data/models/backend_models/abone_bilgi.dart';
import 'package:kaski_nfc_app/data/models/backend_models/oturum_bilgileri.dart';
import 'package:kaski_nfc_app/data/services/frontend_services.dart/device_service.dart';
import 'package:kaski_nfc_app/presentation/controllers/abone_bilgi_controller.dart';
import 'package:kaski_nfc_app/presentation/pages/main_page.dart';
import 'package:kaski_nfc_app/presentation/providers/nfc_provider.dart';
import 'package:package_info_plus/package_info_plus.dart';

class BackendTest extends ConsumerStatefulWidget {
  const BackendTest({super.key});

  @override
  ConsumerState<BackendTest> createState() => _BackendTestState();
}

class _BackendTestState extends ConsumerState<BackendTest> {
  AboneBilgiResponse? _aboneBilgiResponse;
  AboneBilgiController _aboneBilgiController = AboneBilgiController();
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchDatas();
  }

  Future<void> fetchDatas() async {
    try {
      setState(() {
        _isLoading = true;
        _errorMessage = null;
      });

      final deviceData = await DeviceService.getDeviceData();
      final packageInfo = await PackageInfo.fromPlatform();

      final oturumBilgileri = OturumBilgileri(
        oturumTarihi: DateTime.now().toIso8601String(),
        aboneNo: 1,
        kartSeriNo: "31",
        cihazId: deviceData["deviceId"],
        cihazModel: deviceData["model"],
        uygulamaVersiyonu: packageInfo.version,
        sayfa: "backend_test",
      );

      final response = await _aboneBilgiController.getAboneBilgi(
        oturumBilgileri,
      );

      if (mounted) {
        setState(() {
          _aboneBilgiResponse = response;
          _isLoading = false;
        });

        if (response?.hata != null && response!.hata!.isNotEmpty) {
          _errorMessage = response.hataAciklama ?? "Bir hata oluştu";
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
          _errorMessage = "Abone bilgileri yüklenirken hata oldu";
        });
      }
    }
  }

  void _returnToMainPage() {
    final NFCNotifier = ref.read(nfcProvider.notifier);

    NFCNotifier.resetToInitialState();

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const MainPage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: _isLoading
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  LinearProgressIndicator(color: Colors.white),
                  Text(
                    "Yükleniyor",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
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
                      style: const TextStyle(fontSize: 16, color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
                      onPressed: fetchDatas,
                      icon: const Icon(Icons.refresh),
                      label: const Text("Tekrar Dene"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF0D47A1),
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
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_aboneBilgiResponse?.ad ?? "Ad bulunamadı"),
                  GestureDetector(
                    onTap: fetchDatas,
                    child: Container(
                      width: 200,
                      height: 100,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
