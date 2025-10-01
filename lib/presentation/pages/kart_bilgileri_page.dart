import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:kaski_nfc_app/presentation/pages/odeme_kontrolu_page.dart';
import 'package:kaski_nfc_app/core/widgets/custom_button.dart';
import '../../data/models/consumer_card.dart';

class KartBilgileriPage extends StatefulWidget {
  final ConsumerCard cardData;
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

  // Credit Card Widget için değişkenler
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  final TextEditingController _kartNumarasiController = TextEditingController();
  final TextEditingController _isimController = TextEditingController();
  final TextEditingController _sonKullanmaController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  final FocusNode _kartFocus = FocusNode();
  final FocusNode _isimFocus = FocusNode();
  final FocusNode _sonKullanmaFocus = FocusNode();
  final FocusNode _cvvFocus = FocusNode();

  bool isKeyboardVisible(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom > 0;
  }

  @override
  void initState() {
    super.initState();
    print("xxx KartBilgileriPage");

    _kartNumarasiController.text = "4233444433330000";
    _isimController.text = "Tolga";
    _sonKullanmaController.text = "12/30";
    _cvvController.text = "333";

    cardNumber = _kartNumarasiController.text;
    expiryDate = _sonKullanmaController.text;
    cardHolderName = _isimController.text;
    cvvCode = _cvvController.text;

    _cvvFocus.addListener(() {
      setState(() {
        isCvvFocused = _cvvFocus.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _kartNumarasiController.dispose();
    _isimController.dispose();
    _sonKullanmaController.dispose();
    _cvvController.dispose();
    _kartFocus.dispose();
    _isimFocus.dispose();
    _sonKullanmaFocus.dispose();
    _cvvFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardOpen = isKeyboardVisible(context);
    const borderColor = Colors.blue;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text(
          "Kart Bilgileri",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: Column(
        children: [
          // Ana içerik - Expanded ile büyütülür
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  children: [
                    const SizedBox(height: 16),

                    // Credit Card Widget
                    CreditCardWidget(
                      padding: 0,
                      cardBgColor: Colors.black,
                      cardNumber: cardNumber,
                      expiryDate: expiryDate,
                      cardHolderName: _turkishToEnglish(cardHolderName),
                      cvvCode: cvvCode,
                      showBackView: isCvvFocused,
                      obscureCardNumber: true,
                      obscureCardCvv: true,
                      isHolderNameVisible: true,
                      cardType: CardType.otherBrand,
                      onCreditCardWidgetChange: (CreditCardBrand brand) {},
                    ),

                    const SizedBox(height: 16),

                    // Form
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          // Kart Numarası
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
                              labelStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 14,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                  color: borderColor,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                  color: borderColor,
                                  width: 2,
                                ),
                              ),
                              prefixIcon: const Icon(
                                Icons.credit_card,
                                color: Colors.black,
                                size: 20,
                              ),
                            ),
                            textInputAction: TextInputAction.next,
                            onChanged: (value) =>
                                setState(() => cardNumber = value),
                            onFieldSubmitted: (_) =>
                                FocusScope.of(context).requestFocus(_isimFocus),
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  value.length != 16) {
                                return "Geçerli kart numarasını giriniz";
                              }
                              return null;
                            },
                          ),

                          const SizedBox(height: 12),

                          // Kart Sahibi
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
                              labelStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 14,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                  color: borderColor,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                  color: borderColor,
                                  width: 2,
                                ),
                              ),
                            ),
                            textInputAction: TextInputAction.next,
                            onChanged: (value) =>
                                setState(() => cardHolderName = value),
                            onFieldSubmitted: (_) => FocusScope.of(
                              context,
                            ).requestFocus(_sonKullanmaFocus),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Kart sahibinin adını giriniz";
                              }
                              return null;
                            },
                          ),

                          const SizedBox(height: 12),

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
                                    LengthLimitingTextInputFormatter(5),
                                    _ExpiryDateTextInputFormatter(),
                                  ],
                                  decoration: InputDecoration(
                                    labelText: "MM/YY",
                                    labelStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 14,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                        color: borderColor,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                        color: borderColor,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                  textInputAction: TextInputAction.next,
                                  onChanged: (value) =>
                                      setState(() => expiryDate = value),
                                  onFieldSubmitted: (_) => FocusScope.of(
                                    context,
                                  ).requestFocus(_cvvFocus),
                                  validator: (value) {
                                    if (value == null ||
                                        !RegExp(
                                          r'^\d{2}/\d{2}$',
                                        ).hasMatch(value)) {
                                      return "MM/YY formatında giriniz";
                                    }
                                    return null;
                                  },
                                ),
                              ),

                              const SizedBox(width: 12),

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
                                    labelStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 14,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                        color: borderColor,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                        color: borderColor,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                  textInputAction: TextInputAction.done,
                                  onChanged: (value) =>
                                      setState(() => cvvCode = value),
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

                          const SizedBox(height: 24), // Form bitişinde boşluk
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (!keyboardOpen)
            // Ödeme özeti kartı - Burada olsun
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blue.withOpacity(0.5)),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Miktar",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${widget.tonMiktari} ton",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Ödenecek Tutar",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${widget.tutar.toStringAsFixed(0)} TL",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: borderColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          SizedBox(height: 16),
          // Buton - En altta, keyboard durumuna göre
          if (!keyboardOpen)
            CustomButton(
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
    );
  }
}

String _turkishToEnglish(String text) {
  return text
      .replaceAll('ç', 'c')
      .replaceAll('Ç', 'C')
      .replaceAll('ğ', 'g')
      .replaceAll('Ğ', 'G')
      .replaceAll('ı', 'i')
      .replaceAll('İ', 'I')
      .replaceAll('ö', 'o')
      .replaceAll('Ö', 'O')
      .replaceAll('ş', 's')
      .replaceAll('Ş', 'S')
      .replaceAll('ü', 'u')
      .replaceAll('Ü', 'U');
}

// Expiry date formatter
class _ExpiryDateTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String text = newValue.text;

    if (newValue.selection.baseOffset < oldValue.selection.baseOffset) {
      return newValue;
    }

    if (text.length == 2 && !text.contains('/')) {
      text = text + '/';
    }
    if (text.length > 5) {
      text = text.substring(0, 5);
    }

    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}
