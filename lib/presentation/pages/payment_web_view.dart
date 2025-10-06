import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebViewPage extends StatefulWidget {
  final String paymentUrl;
  final String odemeId;

  const PaymentWebViewPage({
    super.key,
    required this.paymentUrl,
    required this.odemeId,
  });

  @override
  State<PaymentWebViewPage> createState() => _PaymentWebViewPageState();
}

class _PaymentWebViewPageState extends State<PaymentWebViewPage> {
  late final WebViewController _controller;
  bool _isLoading = true;
  String _pageTitle = "3D Secure Doğrulama";

  @override
  void initState() {
    super.initState();
    print("🌐 PaymentWebViewPage opened");
    print("📍 Payment URL: ${widget.paymentUrl}");
    print("🆔 Odeme ID: ${widget.odemeId}");

    _initializeWebView();
  }

  void _initializeWebView() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      // 🔥 JavaScript Channel Ekleme - Flutter'a mesaj göndermek için
      ..addJavaScriptChannel(
        'FlutterChannel',
        onMessageReceived: (JavaScriptMessage message) {
          print("📨 JavaScript'ten mesaj alındı: ${message.message}");

          // JavaScript'ten gelen mesajı kontrol et
          if (message.message == 'success') {
            print("✅ Ödeme başarılı mesajı alındı");
            _handlePaymentSuccess();
          } else if (message.message == 'fail' || message.message == 'cancel') {
            print("❌ Ödeme başarısız/iptal mesajı alındı");
            _handlePaymentFailure();
          } else if (message.message == 'close') {
            print("🔒 Kapatma mesajı alındı");
            _handlePaymentSuccess(); // Test için başarılı sayıyoruz
          }
        },
      )
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            print("🔄 Page started loading: $url");
            setState(() {
              _isLoading = true;
            });
          },
          onPageFinished: (String url) {
            print("✅ Page finished loading: $url");
            setState(() {
              _isLoading = false;
            });

            // Sayfa başlığını al
            _controller.getTitle().then((title) {
              if (title != null) {
                setState(() {
                  _pageTitle = title;
                });
              }
            });
          },
          onWebResourceError: (WebResourceError error) {
            print("❌ WebView error: ${error.description}");
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Sayfa yüklenirken hata oluştu: ${error.description}',
                ),
                backgroundColor: Colors.red,
              ),
            );
          },
          onNavigationRequest: (NavigationRequest request) {
            print("🧭 Navigation requested: ${request.url}");

            // Eğer başarılı ödeme URL'sine yönlendirilirse
            if (request.url.contains('success') ||
                request.url.contains('approved') ||
                request.url.contains('complete')) {
              print("✅ Payment successful navigation detected");
              _handlePaymentSuccess();
              return NavigationDecision.prevent;
            }

            // Eğer başarısız ödeme URL'sine yönlendirilirse
            if (request.url.contains('fail') ||
                request.url.contains('error') ||
                request.url.contains('cancel')) {
              print("❌ Payment failed navigation detected");
              _handlePaymentFailure();
              return NavigationDecision.prevent;
            }

            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.paymentUrl));
  }

  void _handlePaymentSuccess() {
    print("🎉 Payment process completed successfully");
    if (!mounted) return;

    // Ödeme başarılı - odemeId ile geri dön
    Navigator.of(context).pop({
      'success': true,
      'odemeId': widget.odemeId,
      'message': 'Ödeme başarıyla tamamlandı',
    });
  }

  void _handlePaymentFailure() {
    print("😞 Payment process failed");
    if (!mounted) return;

    // Ödeme başarısız
    Navigator.of(context).pop({
      'success': false,
      'odemeId': widget.odemeId,
      'message': 'Ödeme işlemi iptal edildi veya başarısız oldu',
    });
  }

  void _showExitConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Row(
            children: const [
              Icon(Icons.warning_amber_rounded, color: Colors.orange, size: 28),
              SizedBox(width: 8),
              Text(
                "Ödeme İptal",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
          content: const Text(
            "Ödeme işlemini iptal etmek istediğinizden emin misiniz?",
            style: TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dialog'u kapat
              },
              child: Text(
                "Hayır",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dialog'u kapat
                _handlePaymentFailure(); // Ödeme sayfasını kapat
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "Evet, İptal Et",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
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
    return WillPopScope(
      onWillPop: () async {
        // Geri tuşuna basıldığında onay al
        _showExitConfirmationDialog();
        return false; // Otomatik geri gitmeyi engelle
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            _pageTitle,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
          leading: IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: _showExitConfirmationDialog,
            tooltip: 'İptal',
          ),
          actions: [
            if (_isLoading)
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
              ),
          ],
        ),
        body: Stack(
          children: [
            WebViewWidget(controller: _controller),
            if (_isLoading)
              Container(
                color: Colors.white,
                child: const Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 16),
                      Text(
                        "3D Secure sayfası yükleniyor...",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
