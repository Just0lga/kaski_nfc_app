import 'package:flutter/material.dart';
import 'package:kaski_nfc_app/data/models/backend_models/gecmis_bilgiler.dart';
import 'package:intl/intl.dart';

class OdemeGecmisiAyrintiliPage extends StatefulWidget {
  const OdemeGecmisiAyrintiliPage({
    super.key,
    required this.gecmisBilgilerResponse,
  });

  final GecmisBilgilerResponse gecmisBilgilerResponse;

  @override
  State<OdemeGecmisiAyrintiliPage> createState() =>
      _OdemeGecmisiAyrintiliPageState();
}

class _OdemeGecmisiAyrintiliPageState extends State<OdemeGecmisiAyrintiliPage> {
  String formatDate(String? date) {
    if (date == null) return "-";
    try {
      final dt = DateTime.parse(date);
      return DateFormat('dd/MM/yyyy HH:mm').format(dt);
    } catch (e) {
      return date;
    }
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.gecmisBilgilerResponse;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Ödeme Detayları"),
        backgroundColor: const Color(0xFF0D47A1),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Kart bilgileri kutusu
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF0D47A1),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ödeme Bilgileri",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  detailRow("Tutar:", "${item.basTutar.toString()} ₺"),
                  detailRow("Su Miktarı:", "${item.basTon.toString()} m³"),
                  detailRow("Ödeme ID:", item.basOdemeId ?? "-"),
                  detailRow("Paydesk Kodu:", item.basPaydeskKodu.toString()),
                  detailRow(
                    "İşlem Tarihi:",
                    formatDate(item.basIslemTarihi.toString()),
                  ),
                  detailRow(
                    "Kart Yazım Başlangıç Tarihi:",
                    formatDate(item.krtYazimBaslangicTarihi.toString()),
                  ),
                  detailRow(
                    "Kart Yazım Tarihi:",
                    formatDate(item.krtYazimTarihi.toString()),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Oturum bilgileri kutusu
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Oturum Bilgileri",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  detailRow("Abone No:", item.otrmAboneNo.toString()),
                  detailRow("Kart Seri No:", item.otrmKartSeriNo ?? "-"),
                  detailRow("Cihaz ID:", item.otrmCihazId ?? "-"),
                  detailRow("Cihaz Model:", item.otrmCihazModel ?? "-"),
                  detailRow(
                    "Oturum Tarihi:",
                    formatDate(item.otrmOturumTarihi.toString()),
                  ),
                  detailRow("Sayfa:", item.otrmSayfa ?? "-"),
                  detailRow(
                    "Uygulama Versiyonu:",
                    item.otrmUygulamaVersiyonu.toString(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Güncelleme ve kayıt tarihi
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Kayıt Bilgileri",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  detailRow(
                    "Kayıt Tarihi:",
                    formatDate(item.kayitTarihi.toString()),
                  ),
                  detailRow(
                    "Güncelleme Tarihi:",
                    formatDate(item.guncellemeTarihi.toString()),
                  ),
                  detailRow("Kurum ID:", item.kurumId.toString()),
                  detailRow("Banka:", item.sncBanka ?? "-"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget detailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.grey[700],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              value,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
