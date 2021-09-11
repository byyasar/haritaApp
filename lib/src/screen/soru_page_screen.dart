import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:haritaapp/src/screen/secenekler_page.dart';

class SoruPage extends StatefulWidget {
  SoruPage({Key? key}) : super(key: key);

  @override
  _SoruPageState createState() => _SoruPageState();
}

class _SoruPageState extends State<SoruPage> {
  List sorular = [];
  int? rastgelesayi;
  int? sorusayisi;

  @override
  void initState() {
    super.initState();
    sorulariOku();
  }

  Future<void> sorulariOku() async {
    final String response =
        await rootBundle.loadString('assets/data/sorular.json');
    final isData = await json.decode(response);

    setState(() {
      sorular = isData;
      sorusayisi = sorular.length;
      //print("sorusayısı ${sorusayisi!}");
      rastgelesayi = Random().nextInt(sorusayisi!);
      print("random ${rastgelesayi!}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context, sorular, rastgelesayi),
      body: _container(context, sorular, rastgelesayi),
    );
  }
}

Container _container(BuildContext context, List? sorular, int? rastgelesayi) {
  print("gelensorular ${sorular!.length}");
  print("gelen raste ${rastgelesayi!}");
  return Container(
    color: Colors.blueAccent.shade100,
    child: Column(
      children: [
        Expanded(
          flex: 8,
          child: Center(
            child: _imageContainer(sorular, rastgelesayi),
          ),
        ),
        Expanded(
          flex: 12,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                sorular[rastgelesayi]["bilgi"],
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ),
        Spacer(flex: 1),
        Expanded(
            flex: 1,
            child: Container(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red, // background
                  onPrimary: Colors.white, // foreground
                ),
                onPressed: () {
                  print("----");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SeceneklerPage(testSorular: sorular,rastgelesayi:rastgelesayi)),
                  );
                },
                child: Text('Ben Bilirim'),
              ),
            )),
        Spacer(flex: 1),
      ],
    ),
  );
}

Container _imageContainer(List? sorular, int? rastgelesayi) {
  return Container(
    margin: EdgeInsets.all(20),
    width: double.infinity,
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 2),
        ),
      ],
      borderRadius: BorderRadius.circular(10.0),
      color: Colors.white,
    ),
    height: 300,
    child: Image.asset("assets/images/${sorular![rastgelesayi!]["image"]}"),
  );
}

_appBar(BuildContext context, List? sorular, int? rastgelesayi) => AppBar(
      title: Text('Kültürel Mirasın Adı ne?'),
      actions: [
        IconButton(
          icon: Icon(Icons.refresh),
          color: Colors.white,
          highlightColor: Colors.red,
          tooltip: 'Burası Talimat Yazısı',
          onPressed: () {
            //print("Butona 1 Kez Tıklandı");
            rastgelesayi = Random().nextInt(sorular!.length);
            print("random ${rastgelesayi!}");
          },
        ),
      ],
    );
