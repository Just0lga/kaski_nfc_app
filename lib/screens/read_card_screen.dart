import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/nfc_provider.dart';
import '../models/consumer_card_dto.dart';

class ReadCardScreen extends StatefulWidget {
  const ReadCardScreen({super.key});

  @override
  State<ReadCardScreen> createState() => _ReadCardScreenState();
}

class _ReadCardScreenState extends State<ReadCardScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    print('🏁 ReadCardScreen initialized');

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Read Card'),
        centerTitle: true,
        actions: [
          Consumer<NFCProvider>(
            builder: (context, nfcProvider, child) {
              if (nfcProvider.cardData != null) {
                return IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: () {
                    print('🔄 Refresh button pressed - reading card again');
                    nfcProvider.readCard();
                  },
                  tooltip: 'Read Again',
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
      body: Consumer<NFCProvider>(
        builder: (context, nfcProvider, child) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // NFC Reading Card
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        if (nfcProvider.isLoading) ...[
                          AnimatedBuilder(
                            animation: _scaleAnimation,
                            builder: (context, child) {
                              return Transform.scale(
                                scale: _scaleAnimation.value,
                                child: const Icon(
                                  Icons.nfc,
                                  size: 80,
                                  color: Color(0xFF363cff),
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Hold your card near the device',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Keep the card steady until reading is complete',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                            textAlign: TextAlign.center,
                          ),
                        ] else if (nfcProvider.cardData != null) ...[
                          const Icon(
                            Icons.check_circle,
                            size: 80,
                            color: Colors.green,
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Card Read Successfully!',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Card information is displayed below',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                            textAlign: TextAlign.center,
                          ),
                        ] else ...[
                          const Icon(
                            Icons.nfc_outlined,
                            size: 80,
                            color: Colors.grey,
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Ready to Read',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Tap the button below to start reading',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                            textAlign: TextAlign.center,
                          ),
                        ],
                        const SizedBox(height: 24),
                        if (!nfcProvider.isLoading &&
                            nfcProvider.cardData == null)
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                print('📖 Read card button pressed');
                                nfcProvider.readCard();
                              },
                              icon: const Icon(Icons.credit_card),
                              label: const Text('Read Card'),
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                backgroundColor: Colors.green,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Card Data Display
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Card Information',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            if (nfcProvider.cardData != null) ...[
                              const Spacer(),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.green[100],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.check_circle,
                                      size: 16,
                                      color: Colors.green,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      'Data Loaded',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ],
                        ),
                        const Divider(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.4,
                          child: nfcProvider.cardData != null
                              ? _buildCardDataList(nfcProvider.cardData!)
                              : _buildEmptyState(),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Message Display
                if (nfcProvider.message.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.all(12),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: nfcProvider.message.contains('success')
                          ? Colors.green[50]
                          : Colors.orange[50],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: nfcProvider.message.contains('success')
                            ? Colors.green[200]!
                            : Colors.orange[200]!,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          nfcProvider.message.contains('success')
                              ? Icons.check_circle
                              : Icons.warning,
                          color: nfcProvider.message.contains('success')
                              ? Colors.green
                              : Colors.orange,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            nfcProvider.message,
                            style: TextStyle(
                              color: nfcProvider.message.contains('success')
                                  ? Colors.green[700]
                                  : Colors.orange[700],
                            ),
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

                const SizedBox(height: 20), // Bottom padding
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildCardDataList(ConsumerCardDTO cardData) {
    print('📋 Building card data list for: ${cardData.toString()}');

    final cardInfo = _buildSafeCardInfoList(cardData);

    return ListView.builder(
      itemCount: cardInfo.length,
      itemBuilder: (context, index) {
        final item = cardInfo[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 4),
          child: ListTile(
            title: Text(
              item['label']!,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            ),
            trailing: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.4,
              ),
              child: Text(
                item['value']!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                textAlign: TextAlign.end,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ),
        );
      },
    );
  }

  List<Map<String, String>> _buildSafeCardInfoList(ConsumerCardDTO cardData) {
    try {
      return [
        {'label': 'Card Serial No', 'value': _formatValue(cardData.cardSeriNo)},
        {
          'label': 'Main Credit',
          'value': _formatValue(cardData.mainCredit?.toString()),
        },
        {
          'label': 'Reserve Credit',
          'value': _formatValue(cardData.reserveCredit?.toString()),
        },
        {
          'label': 'Critical Credit Limit',
          'value': _formatValue(cardData.criticalCreditLimit?.toString()),
        },
        {'label': 'Card ID', 'value': _formatValue(cardData.cardId)},
        {'label': 'Card Number', 'value': _formatValue(cardData.cardNumber)},
        {
          'label': 'Customer Name',
          'value': _formatValue(cardData.customerName),
        },
        {'label': 'Customer ID', 'value': _formatValue(cardData.customerId)},
        {'label': 'Card Status', 'value': _formatValue(cardData.cardStatus)},
        {
          'label': 'Last Transaction',
          'value': _formatDateTime(cardData.lastTransactionDate),
        },
      ];
    } catch (e) {
      print('❌ Error building card info list: $e');
      return [
        {'label': 'Error', 'value': 'Could not load card data'},
      ];
    }
  }

  String _formatValue(String? value) {
    if (value == null || value.isEmpty) return 'N/A';
    // Çok uzun değerleri kısalt
    if (value.length > 50) {
      return '${value.substring(0, 47)}...';
    }
    return value;
  }

  String _formatDateTime(DateTime? dateTime) {
    if (dateTime == null) return 'N/A';
    try {
      return '${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}';
    } catch (e) {
      print('⚠️ Error formatting DateTime: $e');
      return dateTime.toString();
    }
  }

  Widget _buildEmptyState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.credit_card_off, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'No card data available',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 8),
          Text(
            'Read a card to see information here',
            style: TextStyle(fontSize: 14, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
