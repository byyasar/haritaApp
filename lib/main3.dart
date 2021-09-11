import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kartal/kartal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: homePage(),
      //theme: ThemeData.light(),
    );
  }
}

// ignore: camel_case_types
class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  _homePageState createState() => _homePageState();
}

// ignore: camel_case_types
class _homePageState extends State<homePage> {
  List _items = [];
  var kitapData;
  @override
  void initState() {
    super.initState();
    oku();
  }

  Future<void> oku() async {
    final String response =
        await rootBundle.loadString('assets/data/kitap.json');
    final isData = await json.decode(response);

    setState(() {
     _items = isData;
    });
  }
// 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kitaplar'),
      ),
      body: _items.isNullOrEmpty           ? Center(child: CircularProgressIndicator())
          : Container(
              color: Colors.white10,
              child: ListView.builder(
                  itemCount: _items.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    //var kitap = kitapData[index];
                    return Card(
                      margin: EdgeInsets.all(2),
                      child: Column(
                        children: [
                          ListTile(
                            leading: Text(_items[index]["kitapAdi"]),
                            title: Text(
                                _items[index]["yazar"]), //items[index]["resim"]
                          ),
                          Container(
                            padding: context.paddingLow,
                            height: context.dynamicHeight(0.3),
                            child: Image.asset("assets/images/" +
                                _items[index]["resim"] +
                                ".jpg"),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
    );
  }
}
