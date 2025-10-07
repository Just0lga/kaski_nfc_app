import 'package:flutter/material.dart';

class OdemeGecmisiPage extends StatefulWidget {
  const OdemeGecmisiPage({super.key});

  @override
  State<OdemeGecmisiPage> createState() => _OdemeGecmisiPageState();
}

class _OdemeGecmisiPageState extends State<OdemeGecmisiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0D47A1),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Ödeme Geçmişi",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: Column(),
    );
  }
}
