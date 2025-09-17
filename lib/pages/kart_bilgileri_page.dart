import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kaski_nfc_app/pages/odeme_kontrolu_page.dart';
import 'package:kaski_nfc_app/widgets/custom_button.dart';
import '../models/consumer_card_dto.dart';

class KartBilgileriPage extends StatefulWidget {
  final ConsumerCardDTO cardData;
  final double tonMiktari;
  final double tutar;

  const KartBilgileriPage({
    super.key,
    required this.cardData,
    required this.tonMiktari,
    required this.tutar,
  });

  @override
  State<KartBilgileriPage> createState() => _KartBilgileriPageState();
}

class _KartBilgileriPageState extends State<KartBilgileriPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _kartNumarasiController = TextEditingController();
  final TextEditingController _isimController = TextEditingController();
  final TextEditingController _sonKullanmaController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  // FocusNodes for "Next" functionality
  final FocusNode _kartFocus = FocusNode();
  final FocusNode _isimFocus = FocusNode();
  final FocusNode _sonKullanmaFocus = FocusNode();
  final FocusNode _cvvFocus = FocusNode();

  bool isKeyboardVisible(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom > 0;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final keyboardOpen = isKeyboardVisible(context);
    const borderColor = Color.fromRGBO(96, 190, 244, 1.0);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Kart Bilgileri",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.08),
        child: Column(
          children: [
            // Ödeme özeti kartı
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[200]!),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Miktar:", style: TextStyle(fontSize: 16)),
                      Text(
                        "${widget.tonMiktari} ton",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Ödenecek Tutar:",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${widget.tutar.toStringAsFixed(0)} TL",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: borderColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            Expanded(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Kart Numarası (sadece sayı, max 16)
                    TextFormField(
                      controller: _kartNumarasiController,
                      focusNode: _kartFocus,
                      cursorColor: borderColor,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(16),
                      ],
                      decoration: InputDecoration(
                        labelText: "Kart Numarası",
                        labelStyle: const TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: borderColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: borderColor,
                            width: 2,
                          ),
                        ),
                        prefixIcon: const Icon(
                          Icons.credit_card,
                          color: Colors.black,
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_isimFocus);
                      },
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length != 16) {
                          return "Geçerli kart numarasını giriniz";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: height * 0.02),

                    // Kart Sahibi (sadece alfabe)
                    TextFormField(
                      controller: _isimController,
                      focusNode: _isimFocus,
                      cursorColor: borderColor,
                      keyboardType: TextInputType.name,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'[a-zA-ZçÇğĞıİöÖşŞüÜ\s]'),
                        ),
                      ],
                      decoration: InputDecoration(
                        labelText: "Kart Sahibinin Adı",
                        labelStyle: const TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: borderColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: borderColor,
                            width: 2,
                          ),
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_sonKullanmaFocus);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Kart sahibinin adını giriniz";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: height * 0.02),

                    // Son Kullanma Tarihi ve CVV
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _sonKullanmaController,
                            focusNode: _sonKullanmaFocus,
                            cursorColor: borderColor,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp(r'\d|/'),
                              ),
                              LengthLimitingTextInputFormatter(7),
                              _ExpiryDateTextInputFormatter(),
                            ],
                            decoration: InputDecoration(
                              labelText: "MM/YYYY",
                              labelStyle: const TextStyle(color: Colors.black),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                  color: borderColor,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                  color: borderColor,
                                  width: 2,
                                ),
                              ),
                            ),
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context).requestFocus(_cvvFocus);
                            },
                            validator: (value) {
                              if (value == null ||
                                  !RegExp(r'^\d{2}/\d{4}$').hasMatch(value)) {
                                return "Geçerli tarih giriniz";
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(width: width * 0.04),
                        Expanded(
                          child: TextFormField(
                            controller: _cvvController,
                            focusNode: _cvvFocus,
                            cursorColor: borderColor,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(3),
                            ],
                            decoration: InputDecoration(
                              labelText: "CVV",
                              labelStyle: const TextStyle(color: Colors.black),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                  color: borderColor,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                  color: borderColor,
                                  width: 2,
                                ),
                              ),
                            ),
                            textInputAction: TextInputAction.done,
                            validator: (value) {
                              if (value == null || value.length != 3) {
                                return "Geçerli CVV giriniz";
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.04),
                  ],
                ),
              ),
            ),
            keyboardOpen
                ? const SizedBox()
                : CustomButton(
                    buttonText: "Ödeme Yap",
                    buttonColor: borderColor,
                    buttonOnTap: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OdemeKontroluPage(
                              cardData: widget.cardData,
                              tonMiktari: widget.tonMiktari,
                              tutar: widget.tutar,
                            ),
                          ),
                        );
                      }
                    },
                  ),
          ],
        ),
      ),
    );
  }
}

// Özel InputFormatter: MM/YYYY formatını zorlamak için
class _ExpiryDateTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String text = newValue.text;

    // Eğer kullanıcı silerse direkt geri dön
    if (newValue.selection.baseOffset < oldValue.selection.baseOffset) {
      return newValue;
    }

    // '/' karakteri ekle
    if (text.length == 2 && !text.contains('/')) {
      text = text + '/';
    }
    // 7 karakterden fazla olmasın
    if (text.length > 7) {
      text = text.substring(0, 7);
    }

    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}
