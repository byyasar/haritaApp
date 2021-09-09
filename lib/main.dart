import 'package:flutter/material.dart';
import 'package:haritaapp/src/constant.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MainPage(),
      //theme: ThemeData.light(),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: _container,
    );
  }

  Container get _container {
    return Container(
      color: Colors.blueAccent.shade100,
      child: Column(
        children: [
          Expanded(
            flex: 8,
            child: Center(
              child: _imageContainer,
            ),
          ),
          Expanded(
            flex: 12,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  Constants.INFO,
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
                  onPressed: () {},
                  child: Text('Ben Bilirim'),
                ),
              )),
          Spacer(flex: 1),
        ],
      ),
    );
  }

  Container get _imageContainer {
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
      child: Image.asset("assets/images/" + "istanbul" + ".jpg"),
    );
  }

  get _appBar => AppBar(title: Text('Kültürel Mirasın Adı ne?'));
}
