import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:haritaapp/src/screen/harita_page_screen.dart';
import 'package:haritaapp/src/widgets/custom_buton.dart';
import 'package:kartal/kartal.dart';

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
      body: sorular.length == 0
          ? Center(child: CircularProgressIndicator())
          : _container(context, sorular, rastgelesayi),
    );
  }
}

Container _container(BuildContext context, List? sorular, int? rastgelesayi) {
  print("gelensorular ${sorular!.length}");
  print("gelen raste ${rastgelesayi!}");

  return Container(
    //color: Colors.blueAccent.shade100,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: context.dynamicWidth(.4),
            child: soltaraf(context, sorular, rastgelesayi),
          ),
          Container(
            width: context.dynamicWidth(.4),
            child: sagtaraf(context, sorular, rastgelesayi),
          ),
          SizedBox(
            width: context.dynamicWidth(.05),
          ),
        ],
      ),
    ),
  );
}

sagtaraf(BuildContext context, List testSorular, int rastgelesayi) {
  return Center(
    child: ListView.builder(
      shrinkWrap: true,
      itemCount: testSorular[rastgelesayi]["secenekler"].length,
      itemBuilder: (BuildContext context, int i) => Container(
        height: 80,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ButtonWidget(
              butonIcon: Icon(Icons.info, color: Colors.white),
              butonText: testSorular[rastgelesayi]["secenekler"][i].toString(),
              onPressed: () {
                print("cevap seçenek ${testSorular[rastgelesayi]["cevap"]}");
                print(
                    "cevap seçenek ${testSorular[rastgelesayi]["secenekler"][i]}");
                print(i);
                testSorular[rastgelesayi]["cevap"] ==
                        testSorular[rastgelesayi]["secenekler"][i]
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HaritaPage(
                            cevap: testSorular[rastgelesayi]["sehir"],
                          ),
                        ),
                      )
                    : print("yanlış seçenek");
              }),
        ),
      ),
    ),
  );
}

soltaraf(BuildContext context, List sorular, int rastgelesayi) {
  return Column(
    children: [
      Expanded(
        flex: 12,
        child: _imageContainer(context, sorular, rastgelesayi),
      ),
      Spacer(flex: 1),
      Expanded(
        flex: 8,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              sorular[rastgelesayi]["bilgi"],
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
        ),
      ),
    ],
  );
}

Container _imageContainer(
    BuildContext context, List? sorular, int? rastgelesayi) {
  return Container(
    margin: EdgeInsets.all(5),
    width: double.infinity,
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 2,
          offset: Offset(0, 2),
        ),
      ],
      borderRadius: BorderRadius.circular(10.0),
      color: Colors.white,
    ),
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
