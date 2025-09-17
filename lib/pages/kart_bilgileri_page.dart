import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kaski_nfc_app/pages/odeme_kontrolu_page.dart';
import 'package:kaski_nfc_app/widgets/custom_button.dart';

class KartBilgileriPage extends StatefulWidget {
  const KartBilgileriPage({super.key});

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
    final borderColor = Color.fromRGBO(96, 190, 244, 1.0);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
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
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.08),
        child: Column(
          children: [
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
                      cursorColor: borderColor, // imleç rengi
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(16),
                      ],
                      decoration: InputDecoration(
                        labelText: "Kart Numarası",
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: borderColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: borderColor, width: 2),
                        ),
                        prefixIcon: Icon(
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
                          RegExp(r'[a-zA-Z\s]'),
                        ),
                      ],
                      decoration: InputDecoration(
                        labelText: "Kart Sahibinin Adı",
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: borderColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: borderColor, width: 2),
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
                              LengthLimitingTextInputFormatter(
                                7,
                              ), // 2/4 formatında toplam 7 karakter
                              _ExpiryDateTextInputFormatter(),
                            ],
                            decoration: InputDecoration(
                              labelText: "MM/YYYY",
                              labelStyle: TextStyle(color: Colors.black),

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: borderColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
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
                              labelStyle: TextStyle(color: Colors.black),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: borderColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
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
                ? SizedBox()
                : CustomButton(
                    buttonText: "Ödeme Yap",
                    buttonColor: borderColor,
                    buttonOnTap: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OdemeKontroluPage(),
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
    if (newValue.selection.baseOffset < oldValue.selection.baseOffset)
      return newValue;

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
