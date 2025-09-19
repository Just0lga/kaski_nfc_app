import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kaski_nfc_app/pages/kart_bilgileri_page.dart';
import 'package:kaski_nfc_app/widgets/custom_button.dart';
import '../models/consumer_card_dto.dart';

class MiktarGirisiPage extends StatefulWidget {
  final ConsumerCardDTO cardData;

  const MiktarGirisiPage({super.key, required this.cardData});

  @override
  State<MiktarGirisiPage> createState() => _MiktarGirisiPageState();
}

class _MiktarGirisiPageState extends State<MiktarGirisiPage> {
  double tonMiktari = 10.0;
  double tutar = 100.0;
  final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    print("xxx MiktarGirisiPage");
    // TODO: implement initState
    super.initState();
  }

  bool isKeyboardVisible(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom > 0;
  }

  void _showTonDialog() {
    _controller.clear();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          title: const Text(
            "Ton Miktarı Girişi",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          content: TextField(
            controller: _controller,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
            ],
            decoration: InputDecoration(
              labelText: "Ton miktarı",
              hintText: "Örn: 5.5",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(
                  color: Color.fromRGBO(96, 190, 244, 1.0),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(
                  color: Color.fromRGBO(96, 190, 244, 1.0),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(
                  color: Color.fromRGBO(96, 190, 244, 1.0),
                  width: 2,
                ),
              ),
              labelStyle: const TextStyle(
                color: Color.fromRGBO(96, 190, 244, 1.0),
              ),
              suffixText: "ton",
              suffixStyle: const TextStyle(
                color: Color.fromRGBO(96, 190, 244, 1.0),
              ),
            ),
            autofocus: true,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "İptal",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                String input = _controller.text.trim();
                if (input.isNotEmpty) {
                  double? miktar = double.tryParse(input);
                  if (miktar != null && miktar > 0) {
                    setState(() {
                      tonMiktari = miktar;
                      tutar = miktar * 150;
                    });
                    Navigator.of(context).pop();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        behavior: SnackBarBehavior.floating,
                        content: Text("Lütfen geçerli bir miktar giriniz"),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      behavior: SnackBarBehavior.floating,
                      content: Text("Lütfen bir miktar giriniz"),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(96, 190, 244, 1.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: const Text(
                "Kaydet",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final keyboardOpen = isKeyboardVisible(context);

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text(
          "Miktar Girişi",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Mevcut bakiye göstergesi
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: width * 0.08),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.green[50],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.green[200]!),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Mevcut Bakiye:",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "${widget.cardData.mainCredit?.toStringAsFixed(2) ?? "0.00"} TL/m³",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.green[700],
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: height * 0.04),

                    // Miktar seçim alanı
                    GestureDetector(
                      onTap: _showTonDialog,
                      child: Container(
                        width: width * 0.9,
                        height: height * 0.25,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: const Color.fromRGBO(
                            96,
                            190,
                            244,
                            1.0,
                          ).withOpacity(0.2),
                          border: Border.all(
                            color: const Color.fromRGBO(
                              96,
                              190,
                              244,
                              1.0,
                            ).withOpacity(0.5),
                            width: 1,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.04,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                tonMiktari > 0
                                    ? "${tonMiktari.toString()} ton seçildi"
                                    : "Kaç ton yüklemek istiyorsunuz?",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: tonMiktari > 0
                                      ? FontWeight.bold
                                      : FontWeight.w400,
                                  fontSize: 28,
                                  color: tonMiktari > 0
                                      ? const Color.fromRGBO(96, 190, 244, 1.0)
                                      : Colors.black87,
                                ),
                              ),
                              if (tonMiktari > 0)
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Text(
                                    "Değiştirmek için tıklayın",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: height * 0.04),

                    Text(
                      "Tutar: ${tutar.toStringAsFixed(0)} TL",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),

                    SizedBox(height: height * 0.02),

                    // Yüklendikten sonra toplam bakiye tahmini
                    if (tonMiktari > 0)
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: width * 0.08),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.blue[200]!),
                        ),
                        child: Text(
                          "Yükleme sonrası tahmini bakiye: ${((widget.cardData.mainCredit ?? 0.0) + tutar).toStringAsFixed(2)} TL/m³",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.blue[700],
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
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
                    buttonColor: const Color.fromRGBO(238, 145, 32, 1.0),
                    buttonOnTap: () {
                      if (tutar > 0) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => KartBilgileriPage(
                              cardData: widget.cardData,
                              tonMiktari: tonMiktari,
                              tutar: tutar,
                            ),
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            behavior: SnackBarBehavior.floating,
                            content: Text(
                              "${tutar.toStringAsFixed(0)} TL ödeme işlemi başlatıldı",
                            ),
                            backgroundColor: Colors.green,
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            behavior: SnackBarBehavior.floating,
                            content: Text("Lütfen bir miktar giriniz"),
                            backgroundColor: Colors.red,
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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
