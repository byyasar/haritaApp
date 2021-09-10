import 'package:flutter/material.dart';
import 'package:haritaapp/src/widgets/custom_buton.dart';

class AnaPage extends StatelessWidget {
  const AnaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Kültürel miraslarımız uygulamasına hoş geldiniz",
                style: TextStyle(fontSize: 24),
              ),
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ButtonWidget(
                butonText: "Başlayalım",
                radius: 10,
                yukseklik: 32,
                butonIcon: Icon(
                  Icons.info,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "/soru");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
