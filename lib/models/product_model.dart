import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(
    json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  int productId;
  String productPic;
  String productName;
  String productWriter;
  String productDetailEt;
  int productPrice;
  String productIsbn;
  int productCate;
  String productYear;
  String productOwner;
  String productWeight;
  String productPrintColor;
  String productPaper;
  String productWidth;
  String productWide;
  String productHeight;
  int productCost;
  int productAmount;
  String productDetail;
  String productDateCreate;
  String productDateUpdate;
  int productSelled;

  ProductModel({
    required this.productId,
    required this.productPic,
    required this.productName,
    required this.productWriter,
    required this.productDetailEt,
    required this.productPrice,
    required this.productIsbn,
    required this.productCate,
    required this.productYear,
    required this.productOwner,
    required this.productWeight,
    required this.productPrintColor,
    required this.productPaper,
    required this.productWidth,
    required this.productWide,
    required this.productHeight,
    required this.productCost,
    required this.productAmount,
    required this.productDetail,
    required this.productDateCreate,
    required this.productDateUpdate,
    required this.productSelled,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        productId: json["product_id"],
        productPic: json["product_pic"],
        productName: json["product_name"],
        productWriter: json["product_writer"],
        productDetailEt: json["product_detail_et"],
        productPrice: json["product_price"],
        productIsbn: json["product_isbn"],
        productCate: json["product_cate"],
        productYear: json["product_year"],
        productOwner: json["product_owner"],
        productWeight: json["product_weight"],
        productPrintColor: json["product_print_color"],
        productPaper: json["product_paper"],
        productWidth: json["product_width"],
        productWide: json["product_wide"],
        productHeight: json["product_height"],
        productCost: json["product_cost"],
        productAmount: json["product_amount"],
        productDetail: json["product_detail"],
        productDateCreate: json["product_date_create"],
        productDateUpdate: json["product_date_update"],
        productSelled: json["product_selled"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_pic": productPic,
        "product_name": productName,
        "product_writer": productWriter,
        "product_detail_et": productDetailEt,
        "product_price": productPrice,
        "product_isbn": productIsbn,
        "product_cate": productCate,
        "product_year": productYear,
        "product_owner": productOwner,
        "product_weight": productWeight,
        "product_print_color": productPrintColor,
        "product_paper": productPaper,
        "product_width": productWidth,
        "product_wide": productWide,
        "product_height": productHeight,
        "product_cost": productCost,
        "product_amount": productAmount,
        "product_detail": productDetail,
        "product_date_create": productDateCreate,
        "product_date_update": productDateUpdate,
        "product_selled": productSelled,
      };
}
