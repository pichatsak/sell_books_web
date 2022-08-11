import 'dart:convert';

List<TumbonModel> tumbonModelFromJson(String str) => List<TumbonModel>.from(
    json.decode(str).map((x) => TumbonModel.fromJson(x)));

String tumbonModelToJson(List<TumbonModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TumbonModel {
  int id;
  int zipCode;
  String nameTh;
  int amphureId;
  TumbonModel({
    required this.id,
    required this.zipCode,
    required this.nameTh,
    required this.amphureId,
  });

  factory TumbonModel.fromJson(Map<String, dynamic> json) => TumbonModel(
        id: json["id"],
        zipCode: json["zip_code"],
        nameTh: json["name_th"],
        amphureId: json["amphure_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "zip_code": zipCode,
        "name_th": nameTh,
        "amphure_id": amphureId,
      };
}
