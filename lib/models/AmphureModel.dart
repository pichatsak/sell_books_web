import 'dart:convert';

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
        id: json["id"] == null ? null : json["id"],
        nameTh: json["name_th"] == null ? null : json["name_th"],
        provinceId: json["province_id"] == null ? null : json["province_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name_th": nameTh == null ? null : nameTh,
        "province_id": provinceId == null ? null : provinceId,
      };
}
