import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kaski_nfc_app/pages/sonuc_page.dart';

class KartaYukleme extends StatefulWidget {
  const KartaYukleme({super.key});

  @override
  State<KartaYukleme> createState() => _KartaYuklemeState();
}

class _KartaYuklemeState extends State<KartaYukleme> {
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SonucPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromRGBO(163, 221, 253, 1),
      appBar: AppBar(
        title: Text(
          "Karta Yükleme",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: const Color.fromRGBO(68, 95, 116, 1),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Color.fromRGBO(235, 254, 254, 1.0),
              radius: width * 0.2,
              child: SvgPicture.asset(
                'assets/nfc_logo.svg',
                width: height * 0.11,
                color: const Color.fromRGBO(68, 95, 116, 1),
              ),
            ),
            SizedBox(height: height * 0.04),
            Text(
              "Kartınızı telefonunuza yaklaştırın",
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
            SizedBox(height: height * 0.02),
            Text(
              "Su yükleniyor...",
              style: TextStyle(
                color: Color.fromRGBO(235, 254, 254, 1.0),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: height * 0.1),
          ],
        ),
      ),
    );
  }
}
