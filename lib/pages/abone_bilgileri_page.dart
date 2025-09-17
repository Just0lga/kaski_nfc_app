import 'package:flutter/material.dart';
import 'package:kaski_nfc_app/pages/miktar_girisi_page.dart';
import 'package:kaski_nfc_app/widgets/custom_button.dart';

class AboneBilgileriPage extends StatefulWidget {
  const AboneBilgileriPage({super.key});

  @override
  State<AboneBilgileriPage> createState() => _AboneBilgileriPageState();
}

class _AboneBilgileriPageState extends State<AboneBilgileriPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Abone Bilgileri",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.08),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Abone No: ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        Text(
                          "290432934",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.08),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "İsim: ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        Text(
                          "Tolga Küçükaşçı",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.08),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Mecvut Bakiye: ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        Text(
                          "39.94 TL/m3",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            CustomButton(
              buttonText: "Devam et",
              buttonColor: Color.fromRGBO(96, 190, 244, 1.0),
              buttonOnTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MiktarGirisiPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
