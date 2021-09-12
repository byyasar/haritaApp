import 'package:flutter/material.dart';
import 'package:haritaapp/src/widgets/custom_buton.dart';
import 'package:kartal/kartal.dart';

class AnaPage extends StatelessWidget {
  const AnaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: context.dynamicWidth(1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset("assets/images/logo.png"),
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Kültürel miraslarımız uygulamasına hoş geldiniz.",
                style: TextStyle(fontSize: 36),
              ),
            ),
            SizedBox(height: 40),
            Container(
              //color: Colors.white,
              width: 300,
              child: ButtonWidget(
                butonText: "Başlayalım",
                radius: 10,
                butonIcon: Icon(
                  Icons.star_outline,
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
