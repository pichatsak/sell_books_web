import 'dart:convert';

List<ProvinceModel> provinceModelFromJson(String str) =>
    List<ProvinceModel>.from(
        json.decode(str).map((x) => ProvinceModel.fromJson(x)));

String provinceModelToJson(List<ProvinceModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProvinceModel {
  int id;
  String nameTh;
  ProvinceModel({
    required this.id,
    required this.nameTh,
  });

  factory ProvinceModel.fromJson(Map<String, dynamic> json) => ProvinceModel(
        id: json["id"],
        nameTh: json["name_th"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name_th": nameTh,
      };
}
