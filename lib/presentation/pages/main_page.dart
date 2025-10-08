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
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xFF0F172A),
              const Color(0xFF1E293B),
              Color(0xFF0D47A1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(width * 0.06),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.03),

                Text(
                  "Hoşgeldiniz",
                  style: TextStyle(
                    fontSize: width * 0.09,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),

                Text(
                  "Maraş KASKİ",
                  style: TextStyle(
                    fontSize: width * 0.05,
                    color: Color.fromARGB(255, 95, 154, 242),
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(height: height * 0.06),

                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HomeMenuButton(
                        title: "Karta Para Yükle",
                        icon: Icons.credit_card_rounded,
                        color: Color(0xFF0D47A1),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const KartOkumaPage(),
                            ),
                          );
                          debugPrint("Karta Para Yükle tıklandı");
                        },
                      ),

                      SizedBox(height: height * 0.025),

                      HomeMenuButton(
                        title: "Ödeme Geçmişi",
                        icon: Icons.history_rounded,
                        color: Colors.cyan,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const OdemeGecmisiPage(),
                            ),
                          );
                          debugPrint("Ödeme Geçmişi tıklandı");
                        },
                      ),
                    ],
                  ),
                ),

                Center(
                  child: Text(
                    "© 2025 Maraş KASKİ",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.4),
                      fontSize: width * 0.032,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.01),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeMenuButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const HomeMenuButton({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        width: double.infinity,
        height: height * 0.22,
        decoration: BoxDecoration(
          color: const Color(0xFF1E293B),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.white),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.2),
              blurRadius: 30,
              spreadRadius: 0,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              right: -20,
              top: -20,
              child: Container(
                width: width * 0.35,
                height: width * 0.35,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color.withOpacity(0.1),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(width * 0.06),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(width * 0.04),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.15),
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(icon, color: color, size: width * 0.1),
                  ),

                  Text(
                    title,
                    style: TextStyle(
                      fontSize: width * 0.058,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
