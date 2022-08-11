import 'dart:convert' show json;

List<AmphureModel> amphureModelFromJson(String str) => List<AmphureModel>.from(
    json.decode(str).map((x) => AmphureModel.fromJson(x)));

String amphureModelToJson(List<AmphureModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AmphureModel {
  int id;
  String nameTh;
  int provinceId;
  AmphureModel({
    required this.id,
    required this.nameTh,
    required this.provinceId,
  });

  factory AmphureModel.fromJson(Map<String, dynamic> json) => AmphureModel(
        id: json["id"],
        nameTh: json["name_th"],
        provinceId: json["province_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name_th": nameTh,
        "province_id": provinceId,
      };
}
