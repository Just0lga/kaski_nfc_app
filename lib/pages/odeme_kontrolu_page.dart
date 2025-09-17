import 'package:flutter/material.dart';
import 'package:kaski_nfc_app/pages/karta_yukleme_page.dart';

class OdemeKontroluPage extends StatefulWidget {
  const OdemeKontroluPage({super.key});

  @override
  State<OdemeKontroluPage> createState() => _OdemeKontroluPageState();
}

class _OdemeKontroluPageState extends State<OdemeKontroluPage> {
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const KartaYukleme()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromRGBO(163, 221, 253, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Color.fromRGBO(235, 254, 254, 1.0),
              radius: width * 0.2,
              child: Icon(
                Icons.credit_card,
                color: Color.fromRGBO(163, 221, 253, 1),
                size: 100,
              ),
            ),
            SizedBox(height: height * 0.04),

            Text(
              "Ödeme yapılıyor, lütfen bekleyiniz...",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(235, 254, 254, 1.0),
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: height * 0.04),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.15),
              child: LinearProgressIndicator(
                backgroundColor: const Color.fromRGBO(68, 95, 116, 1),
                color: Color.fromRGBO(235, 254, 254, 1.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
