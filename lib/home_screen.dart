import 'package:flutter/material.dart';
import 'package:kaski_nfc_app/nfc_provider.dart';
import 'package:provider/provider.dart';
import 'read_card_screen.dart';
import 'write_card_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Baylan NFC Card Credit'),
        centerTitle: true,
      ),
      body: Consumer<NFCProvider>(
        builder: (context, nfcProvider, child) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header Card
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.nfc,
                          size: 48,
                          color: Color(0xFF363cff),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Baylan Card Operations Demo App',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF363cff),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: _getLicenseStatusColor(
                              nfcProvider.licenseStatus,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                _getLicenseStatusIcon(
                                  nfcProvider.licenseStatus,
                                ),
                                size: 16,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                _getLicenseStatusText(
                                  nfcProvider.licenseStatus,
                                ),
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // NFC Status Card
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              nfcProvider.isNfcEnabled
                                  ? Icons.nfc
                                  : Icons.nfc_outlined,
                              color: nfcProvider.isNfcEnabled
                                  ? Colors.green
                                  : Colors.red,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'NFC Status: ${nfcProvider.isNfcEnabled ? "Enabled" : "Disabled"}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: () => nfcProvider.toggleNFC(true),
                                icon: const Icon(Icons.power_settings_new),
                                label: const Text('Enable NFC'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: () => nfcProvider.toggleNFC(false),
                                icon: const Icon(Icons.power_off),
                                label: const Text('Disable NFC'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Main Action Buttons
                Column(
                  children: [
                    // Read Card Button
                    SizedBox(
                      width: double.infinity,
                      height: 120,
                      child: Card(
                        color: Colors.green[50],
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const ReadCardScreen(),
                              ),
                            );
                          },
                          borderRadius: BorderRadius.circular(12),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.credit_card_outlined,
                                size: 48,
                                color: Colors.green,
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Read Card',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                              Text(
                                'Tap to read NFC card data',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Write Card Button
                    SizedBox(
                      width: double.infinity,
                      height: 120,
                      child: Card(
                        color: Colors.orange[50],
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const WriteCardScreen(),
                              ),
                            );
                          },
                          borderRadius: BorderRadius.circular(12),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.edit, size: 48, color: Colors.orange),
                              SizedBox(height: 8),
                              Text(
                                'Write Card',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange,
                                ),
                              ),
                              Text(
                                'Tap to write credit data to card',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // Message Display
                if (nfcProvider.message.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.blue[200]!),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.info, color: Colors.blue),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            nfcProvider.message,
                            style: const TextStyle(color: Colors.blue),
                          ),
                        ),
                        IconButton(
                          onPressed: nfcProvider.clearMessage,
                          icon: const Icon(Icons.close, size: 16),
                          constraints: const BoxConstraints(),
                          padding: EdgeInsets.zero,
                        ),
                      ],
                    ),
                  ),

                // Loading Indicator
                if (nfcProvider.isLoading)
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(width: 16),
                        Text('Processing...'),
                      ],
                    ),
                  ),

                const SizedBox(height: 20), // Bottom padding
              ],
            ),
          );
        },
      ),
    );
  }

  Color _getLicenseStatusColor(String status) {
    if (status.toLowerCase().contains('valid') ||
        status.toLowerCase().contains('başarılı')) {
      return Colors.green;
    } else if (status.toLowerCase().contains('invalid') ||
        status.toLowerCase().contains('expired')) {
      return Colors.red;
    }
    return Colors.orange;
  }

  IconData _getLicenseStatusIcon(String status) {
    if (status.toLowerCase().contains('valid') ||
        status.toLowerCase().contains('başarılı')) {
      return Icons.check_circle;
    } else if (status.toLowerCase().contains('invalid') ||
        status.toLowerCase().contains('expired')) {
      return Icons.error;
    }
    return Icons.warning;
  }

  String _getLicenseStatusText(String status) {
    if (status.toLowerCase().contains('valid') ||
        status.toLowerCase().contains('başarılı')) {
      return 'License Valid';
    } else if (status.toLowerCase().contains('invalid')) {
      return 'License Invalid';
    } else if (status.toLowerCase().contains('expired')) {
      return 'License Expired';
    } else if (status.isEmpty) {
      return 'License Checking...';
    }
    return 'License Status';
  }
}
