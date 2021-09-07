import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/services.dart' show rootBundle;

main() {
  setUp(() {
    print('here');
  });
  
test('json listeleme', () async {
    //String isData = "";
    ///Users/yasar/haritaapp/haritaapp/assets/json/kitap.json
    String? response =
        await rootBundle.loadString('assets/data/kitap.json');
    String? isData = await json.decode(response);
    print(isData.toString());
    expect(isData, isNotNull);
  });
}
