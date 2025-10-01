import 'package:flutter/material.dart';
import 'package:kaski_nfc_app/presentation/pages/main_page.dart';
import 'package:kaski_nfc_app/presentation/pages/start_page.dart';
import '../../data/models/consumer_card.dart';

class SonucPage extends StatelessWidget {
  final ConsumerCard cardData;
  final double yuklenenMiktar;
  final double tutar;
  final double yeniToplamBakiye;

  const SonucPage({
    super.key,
    required this.cardData,
    required this.yuklenenMiktar,
    required this.tutar,
    required this.yeniToplamBakiye,
  });

  @override
  Widget build(BuildContext context) {
    print("xxx SonucPage");
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "İşlem Sonucu",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false, // Geri butonu kaldır
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 16),

                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            const Color(0xFF10B981).withOpacity(0.1),
                            const Color(0xFF10B981).withOpacity(0.05),
                          ],
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.check_circle_rounded,
                        color: Colors.green,
                        size: 120,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "İşlem Başarılı!",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                        color: Colors.green,
                        letterSpacing: -0.5,
                      ),
                    ),

                    SizedBox(height: 16),

                    // İşlem detayları
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: width * 0.08),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.blue[200]!),
                      ),
                      child: Column(
                        children: [
                          // Yüklenen miktar
                          _buildDetailRow(
                            "Yüklenen Miktar",
                            "${yuklenenMiktar.toString()} ton",
                          ),

                          const SizedBox(height: 12),

                          // Ödenen tutar
                          _buildDetailRow(
                            "Ödenen Tutar",
                            "${tutar.toStringAsFixed(0)} TL",
                          ),

                          const SizedBox(height: 12),

                          // Önceki bakiye
                          _buildDetailRow(
                            "Önceki Bakiye",
                            "${(cardData.mainCredit ?? 0.0).toStringAsFixed(2)} TL/m³",
                          ),

                          const SizedBox(height: 12),

                          // Tarih/Saat
                          _buildDetailRow(
                            "İşlem Tarihi",
                            _getCurrentDateTime(),
                          ),

                          const SizedBox(height: 12),

                          // Müşteri bilgileri
                          if (cardData.customerName != null &&
                              cardData.customerName!.isNotEmpty)
                            Column(
                              children: [
                                _buildDetailRow(
                                  "Müşteri",
                                  cardData.customerName!,
                                ),
                                const SizedBox(height: 12),
                              ],
                            ),

                          // Kart seri no
                          if (cardData.cardSeriNo != null &&
                              cardData.cardSeriNo!.isNotEmpty)
                            _buildDetailRow(
                              "Kart Seri No",
                              cardData.cardSeriNo!,
                            ),
                        ],
                      ),
                    ),

                    SizedBox(height: height * 0.03),

                    // Bilgilendirme mesajı
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: width * 0.08),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.green[50],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Color(0xFF10B981)),
                      ),
                      child:
                          // Yeni toplam bakiye
                          _buildDetailRow(
                            "Yeni Bakiye",
                            "${yeniToplamBakiye.toStringAsFixed(2)} TL/m³",
                            isHighlighted: true,
                          ),
                    ),

                    SizedBox(height: height * 0.02),
                  ],
                ),
              ),
            ),

            // Ana sayfaya dön butonu
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Ana sayfaya geri dön (tüm sayfaları kaldır)
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => const MainPage()),
                      (route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Ana Sayfaya Dön",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(
    String label,
    String value, {
    bool isHighlighted = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: isHighlighted ? 18 : 16,
            color: isHighlighted ? Colors.green : Colors.black,
          ),
        ),
        Flexible(
          child: Text(
            value,
            style: TextStyle(
              fontWeight: isHighlighted ? FontWeight.bold : FontWeight.w400,
              fontSize: isHighlighted ? 18 : 16,
              color: isHighlighted ? Colors.green : Colors.black,
            ),
            textAlign: TextAlign.end,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  String _getCurrentDateTime() {
    try {
      final now = DateTime.now();
      return "${now.day.toString().padLeft(2, '0')}.${now.month.toString().padLeft(2, '0')}.${now.year} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}";
    } catch (e) {
      return "İşlem Tamamlandı";
    }
  }
}
