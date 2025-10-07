import 'package:flutter/material.dart';
import 'package:kaski_nfc_app/data/services/frontend_services.dart/device_service.dart';
import 'package:kaski_nfc_app/presentation/pages/odeme_gecmisi_page.dart';
import 'package:kaski_nfc_app/presentation/pages/kart_okuma_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String deviceId = "";
  String model = "";

  @override
  void initState() {
    super.initState();
    loadDeviceData();
  }

  Future<void> loadDeviceData() async {
    final data = await DeviceService.getDeviceData();
    setState(() {
      model = data["model"]!;
      deviceId = data["deviceId"]!;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: const Text(
          "Ana Sayfa",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(width * 0.03),
        child: Column(
          children: [
            Text(model),
            Text(deviceId),
            HomeMenuButton(
              title: "Karta Para Yükle",
              icon: Icons.credit_card,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => KartOkumaPage()),
                );
                debugPrint("Karta Para Yükle tıklandı");
              },
            ),
            SizedBox(height: width * 0.03),
            HomeMenuButton(
              title: "Ödeme Geçmişi",
              icon: Icons.history,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OdemeGecmisiPage()),
                );
                debugPrint("Ödeme Geçmişi tıklandı");
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// 🔹 Ortak buton widget’ı
class HomeMenuButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const HomeMenuButton({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: width * 0.06),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF60BEF4), Color(0xFF2563EB)],

            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(width * 0.04),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 8,
              offset: const Offset(2, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: width * 0.08),
            SizedBox(width: width * 0.04),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: width * 0.06,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
