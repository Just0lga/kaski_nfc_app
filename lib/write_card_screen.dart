import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kaski_nfc_app/credit_request_dto.dart';
import 'package:kaski_nfc_app/enums.dart';
import 'package:kaski_nfc_app/nfc_provider.dart';
import 'package:provider/provider.dart';

class WriteCardScreen extends StatefulWidget {
  const WriteCardScreen({super.key});

  @override
  State<WriteCardScreen> createState() => _WriteCardScreenState();
}

class _WriteCardScreenState extends State<WriteCardScreen>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _creditController = TextEditingController();
  final _reserveCreditController = TextEditingController();
  final _criticalCreditController = TextEditingController();

  OperationType _selectedOperationType = OperationType.none;

  late AnimationController _animationController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _pulseAnimation = Tween<double>(begin: 0.8, end: 1.1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.repeat(reverse: true);

    // Load current card data if available
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<NFCProvider>(context, listen: false);
      if (provider.cardData != null) {
        _creditController.text =
            provider.cardData!.mainCredit?.toString() ?? '';
        _reserveCreditController.text =
            provider.cardData!.reserveCredit?.toString() ?? '';
        _criticalCreditController.text =
            provider.cardData!.criticalCreditLimit?.toString() ?? '';
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _creditController.dispose();
    _reserveCreditController.dispose();
    _criticalCreditController.dispose();
    super.dispose();
  }

  void _writeCard() {
    if (_formKey.currentState!.validate()) {
      final creditRequest = CreditRequestDTO(
        credit: double.parse(_creditController.text),
        reserveCreditLimit: double.parse(_reserveCreditController.text),
        criticalCreditLimit: double.parse(_criticalCreditController.text),
        operationType: _selectedOperationType,
      );

      Provider.of<NFCProvider>(context, listen: false).writeCard(creditRequest);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Write Card'), centerTitle: true),
      body: Consumer<NFCProvider>(
        builder: (context, nfcProvider, child) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // NFC Writing Status Card
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        if (nfcProvider.isLoading) ...[
                          AnimatedBuilder(
                            animation: _pulseAnimation,
                            builder: (context, child) {
                              return Transform.scale(
                                scale: _pulseAnimation.value,
                                child: const Icon(
                                  Icons.nfc,
                                  size: 80,
                                  color: Colors.orange,
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Writing to card...',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Keep the card near the device',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                            textAlign: TextAlign.center,
                          ),
                        ] else ...[
                          const Icon(
                            Icons.edit,
                            size: 80,
                            color: Colors.orange,
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Ready to Write',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Fill the form and tap Write Card button',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Form Card
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Credit Information',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Operation Type Dropdown
                          DropdownButtonFormField<OperationType>(
                            value: _selectedOperationType,
                            decoration: const InputDecoration(
                              labelText: 'Operation Type',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.settings),
                            ),
                            items: OperationType.values.map((type) {
                              return DropdownMenuItem(
                                value: type,
                                child: Text(type.displayName),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _selectedOperationType = value!;
                              });
                            },
                            validator: (value) {
                              if (value == OperationType.none) {
                                return 'Please select an operation type';
                              }
                              return null;
                            },
                          ),

                          const SizedBox(height: 16),

                          // Credit Fields Row
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: _creditController,
                                  decoration: const InputDecoration(
                                    labelText: 'Credit',
                                    border: OutlineInputBorder(),
                                    prefixIcon: Icon(
                                      Icons.account_balance_wallet,
                                    ),
                                  ),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp(r'^\d*\.?\d*'),
                                    ),
                                  ],
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Required';
                                    }
                                    if (double.tryParse(value) == null) {
                                      return 'Invalid number';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 16),

                          // Reserve Credit and Critical Credit Row
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: _reserveCreditController,
                                  decoration: const InputDecoration(
                                    labelText: 'Reserve Limit',
                                    border: OutlineInputBorder(),
                                    prefixIcon: Icon(Icons.savings),
                                  ),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp(r'^\d*\.?\d*'),
                                    ),
                                  ],
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Required';
                                    }
                                    if (double.tryParse(value) == null) {
                                      return 'Invalid';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: TextFormField(
                                  controller: _criticalCreditController,
                                  decoration: const InputDecoration(
                                    labelText: 'Critical Limit',
                                    border: OutlineInputBorder(),
                                    prefixIcon: Icon(Icons.warning),
                                  ),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp(r'^\d*\.?\d*'),
                                    ),
                                  ],
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Required';
                                    }
                                    if (double.tryParse(value) == null) {
                                      return 'Invalid';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 24),

                          // Write Button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: nfcProvider.isLoading
                                  ? null
                                  : _writeCard,
                              icon: const Icon(Icons.edit),
                              label: Text(
                                nfcProvider.isLoading
                                    ? 'Writing...'
                                    : 'Write Card',
                              ),
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                backgroundColor: Colors.orange,
                                disabledBackgroundColor: Colors.grey,
                              ),
                            ),
                          ),

                          const SizedBox(height: 16),

                          // Load from Read Card Button
                          if (nfcProvider.cardData != null)
                            SizedBox(
                              width: double.infinity,
                              child: OutlinedButton.icon(
                                onPressed: () {
                                  _creditController.text =
                                      nfcProvider.cardData!.mainCredit
                                          ?.toString() ??
                                      '';
                                  _reserveCreditController.text =
                                      nfcProvider.cardData!.reserveCredit
                                          ?.toString() ??
                                      '';
                                  _criticalCreditController.text =
                                      nfcProvider.cardData!.criticalCreditLimit
                                          ?.toString() ??
                                      '';
                                },
                                icon: const Icon(Icons.download),
                                label: const Text('Load from Read Card'),
                              ),
                            ),
                        ],
                      ),
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
}
