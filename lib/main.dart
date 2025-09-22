import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Provider yerine Riverpod
import 'pages/start_page.dart';

void main() {
  // Hata yakalama
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    print('🚨 Flutter Error: ${details.exception}');
    print('📍 Stack trace: ${details.stack}');
  };

  runApp(
    // ChangeNotifierProvider yerine ProviderScope
    ProviderScope(child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KASKI NFC Su Yükleme',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color.fromRGBO(96, 190, 244, 1.0),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: const Color.fromRGBO(96, 190, 244, 1.0),
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Color.fromRGBO(96, 190, 244, 1.0),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Color.fromRGBO(96, 190, 244, 1.0),
              width: 2,
            ),
          ),
          labelStyle: const TextStyle(color: Color.fromRGBO(96, 190, 244, 1.0)),
        ),
      ),
      home: const StartPage(),
      debugShowCheckedModeBanner: false,
      builder: (context, widget) {
        ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
          print('🚨 Widget Error: ${errorDetails.exception}');
          return Material(
            child: Container(
              color: Colors.red[100],
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error, color: Colors.red, size: 48),
                  const SizedBox(height: 16),
                  const Text(
                    'Bir hata oluştu!',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    errorDetails.exception.toString(),
                    style: const TextStyle(fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        };
        return widget!;
      },
    );
  }
}
