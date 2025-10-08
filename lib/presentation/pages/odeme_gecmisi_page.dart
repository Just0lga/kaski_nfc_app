import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaski_nfc_app/data/models/frontend_models/consumer_card.dart';
import 'package:kaski_nfc_app/presentation/pages/main_page.dart';
import 'package:kaski_nfc_app/presentation/providers/nfc_provider.dart';

class OdemeGecmisiPage extends ConsumerStatefulWidget {
  final ConsumerCard cardData;

  const OdemeGecmisiPage({super.key, required this.cardData});

  @override
  ConsumerState<OdemeGecmisiPage> createState() => _OdemeGecmisiPageState();
}

class _OdemeGecmisiPageState extends ConsumerState<OdemeGecmisiPage> {
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
    return Scaffold(
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
      body: Column(
        children: [
          Text("cardId: ${widget.cardData.cardSeriNo}"),
          Text("customerId: ${widget.cardData.customerNo}"),
        ],
      ),
    );
  }
}
