import 'package:flutter/material.dart';
import 'package:haritaapp/src/screen/harita_page_screen.dart';
import 'package:haritaapp/src/widgets/custom_buton.dart';

class SeceneklerPage extends StatefulWidget {
  final List? testSorular;
  final int? rastgelesayi;
  SeceneklerPage(
      {Key? key, @required this.testSorular, @required this.rastgelesayi})
      : super(key: key);

  @override
  _SeceneklerPageState createState() => _SeceneklerPageState();
}

class _SeceneklerPageState extends State<SeceneklerPage> {
  List gelensoru = [];
  int rastgelesayi = 0;

  @override
  void initState() {
    super.initState();
    gelensoru = widget.testSorular!;
    rastgelesayi = widget.rastgelesayi!;
    //print("gelen-sorular ${widget.testSorular![rastgelesayi].length}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: Container(
        child: ListView.builder(
          itemCount: widget.testSorular![rastgelesayi]["secenekler"].length,
          itemBuilder: (BuildContext context, int i) => Container(
            height: 80,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ButtonWidget(
                  butonIcon: Icon(Icons.info, color: Colors.white),
                  butonText: widget.testSorular![rastgelesayi]["secenekler"][i]
                      .toString(),
                  onPressed: () {
                    print(
                        "cevap seçenek ${widget.testSorular![rastgelesayi]["cevap"]}");
                    print(
                        "cevap seçenek ${widget.testSorular![rastgelesayi]["secenekler"][i]}");
                    print(i);
                    widget.testSorular![rastgelesayi]["cevap"] ==
                            widget.testSorular![rastgelesayi]["secenekler"][i]
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HaritaPage(
                                cevap: widget.testSorular![rastgelesayi]
                                    ["sehir"],
                              ),
                            ),
                          )
                        : print("yanlış seçenek");
                  }),
            ),
          ),
        ),
      ),
    );
  }
}

get _appBar => AppBar(title: Text('Kültürel Mirasın Adı ne?'));
