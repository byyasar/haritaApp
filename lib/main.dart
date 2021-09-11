import 'package:flutter/material.dart';
import 'package:haritaapp/src/models/soru.dart';
import 'package:haritaapp/src/screen/ana_page_screen.dart';
import 'package:haritaapp/src/screen/harita_page_screen.dart';
import 'package:haritaapp/src/screen/secenekler_page.dart';
import 'package:haritaapp/src/screen/soru_page_screen.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Soru>? _testsorular;
    String? _sehir;
    int? _rastgelesayi;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      //home: MainPage(),
      //theme: ThemeData.light(),
      initialRoute: "/soru",
      routes: {
        "/": (context) => AnaPage(),
        "/soru": (context) => SoruPage(),
        //"/secim": (context) => MainPage(),
        "/harita": (context) => HaritaPage(
              cevap: _sehir,
            ),
        "/secenekler": (context) => SeceneklerPage(
              testSorular: _testsorular,
              rastgelesayi: _rastgelesayi,
            ),
      },
    );
  }
}
