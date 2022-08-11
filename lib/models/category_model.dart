import 'dart:convert';

class CategoryModel {
  int categoryId;
  String cateName;
  int cateNum;
  String dateCreate;
  String dateUpdate;
  CategoryModel({
    required this.categoryId,
    required this.cateName,
    required this.cateNum,
    required this.dateCreate,
    required this.dateUpdate,
  });

  CategoryModel copyWith({
    int? categoryId,
    String? cateName,
    int? cateNum,
    String? dateCreate,
    String? dateUpdate,
  }) {
    return CategoryModel(
      categoryId: categoryId ?? this.categoryId,
      cateName: cateName ?? this.cateName,
      cateNum: cateNum ?? this.cateNum,
      dateCreate: dateCreate ?? this.dateCreate,
      dateUpdate: dateUpdate ?? this.dateUpdate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'categoryId': categoryId,
      'cateName': cateName,
      'cateNum': cateNum,
      'dateCreate': dateCreate,
      'dateUpdate': dateUpdate,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      categoryId: map['categoryId']?.toInt() ?? 0,
      cateName: map['cateName'] ?? '',
      cateNum: map['cateNum']?.toInt() ?? 0,
      dateCreate: map['dateCreate'] ?? '',
      dateUpdate: map['dateUpdate'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CategoryModel(categoryId: $categoryId, cateName: $cateName, cateNum: $cateNum, dateCreate: $dateCreate, dateUpdate: $dateUpdate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CategoryModel &&
        other.categoryId == categoryId &&
        other.cateName == cateName &&
        other.cateNum == cateNum &&
        other.dateCreate == dateCreate &&
        other.dateUpdate == dateUpdate;
  }

  @override
  int get hashCode {
    return categoryId.hashCode ^
        cateName.hashCode ^
        cateNum.hashCode ^
        dateCreate.hashCode ^
        dateUpdate.hashCode;
  }
}
