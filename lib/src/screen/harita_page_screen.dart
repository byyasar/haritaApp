import 'package:flutter/material.dart';
import 'package:haritaapp/city_picker_from_map.dart';

class HaritaPage extends StatefulWidget {
  String? cevap;
  HaritaPage({Key? key, this.cevap}) : super(key: key);

  @override
  _HaritaPageState createState() => _HaritaPageState();
}

class _HaritaPageState extends State<HaritaPage> {
  City? selectedCity;
  final GlobalKey<CityPickerMapState> _mapKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    //print("Gelen şehir ${widget.cevap}");
    return Scaffold(
      appBar: AppBar(
        title: Text('Selected City: ${selectedCity?.title ?? '(?)'}'),
        actions: [
          IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                _mapKey.currentState?.clearSelect();
                setState(() {
                  selectedCity = null;
                });
              })
        ],
      ),
      body: Center(
        child: InteractiveViewer(
          scaleEnabled: true,
          panEnabled: true,
          constrained: true,
          child: CityPickerMap(
            key: _mapKey,
            width: double.infinity,
            height: double.infinity,
            map: Maps.TURKEY,
            onChanged: (city) {
              //print("Gelen şehir ${widget.cevap}");
              setState(() {
                selectedCity = city;
                print('seçilen şehir ' + city!.title.toString());
                print("Gelen şehir ${widget.cevap}");
                "${widget.cevap}" == city.title.toString()
                    ? _showMyDialog(context, true)
                    : _showMyDialog(context, false);
              });
            },
            actAsToggle: true,
            dotColor: Colors.orange, //haritadaki illerin noktası
            selectedColor: Colors.lightBlueAccent,
            strokeColor: Colors.purple, //harita çizgi rengi
          ),
        ),
      ),
    );
  }
}

Future<void> _showMyDialog(BuildContext context, bool dogrumu) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title:
            dogrumu == true ? const Text('Tebrikler') : const Text('Üzgünüm'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              dogrumu == true ? Text("Tebrikler") : Text("Üzgünüm"),
              //Text(dogrumu==true?'Tebrikler':'Üzgünüm'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Tamam'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
