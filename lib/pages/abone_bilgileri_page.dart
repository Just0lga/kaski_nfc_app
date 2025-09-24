import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaski_nfc_app/pages/miktar_girisi_page.dart';
import 'package:kaski_nfc_app/pages/start_page.dart';
import 'package:kaski_nfc_app/widgets/custom_button.dart';
import '../models/consumer_card_dto.dart';
import '../providers/nfc_provider.dart';

class AboneBilgileriPage extends ConsumerStatefulWidget {
  final ConsumerCardDTO cardData;

  const AboneBilgileriPage({super.key, required this.cardData});

  @override
  ConsumerState<AboneBilgileriPage> createState() => _AboneBilgileriPageState();
}

class _AboneBilgileriPageState extends ConsumerState<AboneBilgileriPage> {
  @override
  void initState() {
    print("xxx AboneBilgileriPage");
    super.initState();
  }

  void _returnToStartPage() {
    final nfcNotifier = ref.read(nfcProvider.notifier);

    print("🔄 Resetting NFC provider and returning to start page");

    nfcNotifier.resetToInitialState();

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const StartPage()),
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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Abone Bilgileri",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.home, color: Colors.white),
          onPressed: _returnToStartPage,
          tooltip: 'Ana Sayfa',
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
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
                  SizedBox(height: 16),
                  _buildInfoCard(
                    title: "ABONE NO",
                    value: widget.cardData.cardSeriNo ?? "Bilinmiyor",
                    icon: Icons.numbers,
                    iconColor: const Color(0xFF10B981),
                  ),

                  _buildInfoCard(
                    title: "İSİM",
                    value: widget.cardData.customerName ?? "Bilinmiyor",
                    icon: Icons.person_rounded,
                    iconColor: const Color(0xFF8B5CF6),
                  ),

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
