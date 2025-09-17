import 'package:flutter/material.dart';
import 'package:kaski_nfc_app/pages/miktar_girisi_page.dart';
import 'package:kaski_nfc_app/pages/start_page.dart';
import 'package:kaski_nfc_app/widgets/custom_button.dart';
import '../models/consumer_card_dto.dart';

class AboneBilgileriPage extends StatefulWidget {
  final ConsumerCardDTO cardData;

  const AboneBilgileriPage({super.key, required this.cardData});

  @override
  State<AboneBilgileriPage> createState() => _AboneBilgileriPageState();
}

class _AboneBilgileriPageState extends State<AboneBilgileriPage> {
  @override
  void initState() {
    print("xxx AboneBilgileriPage");
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Abone Bilgileri",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.home, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const StartPage()),
              (route) => false,
            );
          },
          tooltip: 'Ana Sayfa',
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Kart Seri No (Abone No olarak kullan)
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.08),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Abone No: ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            widget.cardData.cardSeriNo ?? "Bilinmiyor",
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 22,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.02),

                  // Müşteri Adı
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.08),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "İsim: ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            widget.cardData.customerName ?? "Bilinmiyor",
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 22,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.02),

                  // Mevcut Bakiye (Ana Kredi)
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.08),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Mevcut Bakiye: ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            "${widget.cardData.mainCredit?.toStringAsFixed(2) ?? "0.00"} TL/m³",
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 22,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: height * 0.04),

                  // Ek bilgiler kartı
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: width * 0.08),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey[200]!),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Müşteri ID:",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                widget.cardData.customerId ?? "N/A",
                                style: const TextStyle(fontSize: 16),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Kart Durumu:",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.green[100],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                widget.cardData.cardStatus ?? "Aktif",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.green[700],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        if (widget.cardData.reserveCredit != null &&
                            widget.cardData.reserveCredit! > 0) ...[
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Rezerv Bakiye:",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "${widget.cardData.reserveCredit!.toStringAsFixed(2)} TL",
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
            CustomButton(
              buttonText: "Devam et",
              buttonColor: const Color.fromRGBO(96, 190, 244, 1.0),
              buttonOnTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        MiktarGirisiPage(cardData: widget.cardData),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
