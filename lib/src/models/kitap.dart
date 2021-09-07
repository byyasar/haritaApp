import 'package:vexana/vexana.dart';

class Kitap extends INetworkModel<Kitap> {
  final String? kitapAdi;
  final String? yazar;
  final String? resim;

  Kitap({this.kitapAdi, this.yazar, this.resim});

  @override
  Kitap fromJson(Map<String, dynamic> json) {
    return Kitap.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kitapAdi'] = this.kitapAdi;
    data['yazar'] = this.yazar;
    data['resim'] = this.resim;
    return data;
  }

  factory Kitap.fromJson(Map<String, dynamic> json) => Kitap(
        kitapAdi: json["kitapAdi"],
        yazar: json["yazar"],
        resim: json["resim"],
      );
}
