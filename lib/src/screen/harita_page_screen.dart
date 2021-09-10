import 'package:flutter/material.dart';
import 'package:haritaapp/city_picker_from_map.dart';
import 'city_picker_from_map.dart';

class HaritaPage extends StatefulWidget {
  HaritaPage({Key? key}) : super(key: key);

  @override
  _HaritaPageState createState() => _HaritaPageState();
}

class _HaritaPageState extends State<HaritaPage> {
  City? selectedCity;
  final GlobalKey<CityPickerMapState> _mapKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
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
              setState(() {
                selectedCity = city;
                print('seçilen şehir ' + city!.title.toString());
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
