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
        productId: json["product_id"] == null ? null : json["product_id"],
        productPic: json["product_pic"] == null ? null : json["product_pic"],
        productName: json["product_name"] == null ? null : json["product_name"],
        productWriter:
            json["product_writer"] == null ? null : json["product_writer"],
        productDetailEt: json["product_detail_et"] == null
            ? null
            : json["product_detail_et"],
        productPrice:
            json["product_price"] == null ? null : json["product_price"],
        productIsbn: json["product_isbn"] == null ? null : json["product_isbn"],
        productCate: json["product_cate"] == null ? null : json["product_cate"],
        productYear: json["product_year"] == null ? null : json["product_year"],
        productOwner:
            json["product_owner"] == null ? null : json["product_owner"],
        productWeight:
            json["product_weight"] == null ? null : json["product_weight"],
        productPrintColor: json["product_print_color"] == null
            ? null
            : json["product_print_color"],
        productPaper:
            json["product_paper"] == null ? null : json["product_paper"],
        productWidth:
            json["product_width"] == null ? null : json["product_width"],
        productWide: json["product_wide"] == null ? null : json["product_wide"],
        productHeight:
            json["product_height"] == null ? null : json["product_height"],
        productCost: json["product_cost"] == null ? null : json["product_cost"],
        productAmount:
            json["product_amount"] == null ? null : json["product_amount"],
        productDetail:
            json["product_detail"] == null ? null : json["product_detail"],
        productDateCreate: json["product_date_create"] == null
            ? null
            : json["product_date_create"],
        productDateUpdate: json["product_date_update"] == null
            ? null
            : json["product_date_update"],
        productSelled:
            json["product_selled"] == null ? null : json["product_selled"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId == null ? null : productId,
        "product_pic": productPic == null ? null : productPic,
        "product_name": productName == null ? null : productName,
        "product_writer": productWriter == null ? null : productWriter,
        "product_detail_et": productDetailEt == null ? null : productDetailEt,
        "product_price": productPrice == null ? null : productPrice,
        "product_isbn": productIsbn == null ? null : productIsbn,
        "product_cate": productCate == null ? null : productCate,
        "product_year": productYear == null ? null : productYear,
        "product_owner": productOwner == null ? null : productOwner,
        "product_weight": productWeight == null ? null : productWeight,
        "product_print_color":
            productPrintColor == null ? null : productPrintColor,
        "product_paper": productPaper == null ? null : productPaper,
        "product_width": productWidth == null ? null : productWidth,
        "product_wide": productWide == null ? null : productWide,
        "product_height": productHeight == null ? null : productHeight,
        "product_cost": productCost == null ? null : productCost,
        "product_amount": productAmount == null ? null : productAmount,
        "product_detail": productDetail == null ? null : productDetail,
        "product_date_create":
            productDateCreate == null ? null : productDateCreate,
        "product_date_update":
            productDateUpdate == null ? null : productDateUpdate,
        "product_selled": productSelled == null ? null : productSelled,
      };
}
