import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaski_nfc_app/presentation/pages/main_page.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KASKI NFC Su Yükleme',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        // 🎯 Sadece cursor ayarı
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color.fromRGBO(96, 190, 244, 1.0),
          selectionHandleColor: Color.fromRGBO(96, 190, 244, 1.0),
        ),
      ),
      home: const MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
