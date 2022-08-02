import 'dart:convert';

class CartViewModel {
  int cartId;
  int userId;
  int productId;
  String productName;
  int num;
  int price;
  int total;
  String productPic;
  int productAmount;
  CartViewModel({
    required this.cartId,
    required this.userId,
    required this.productId,
    required this.productName,
    required this.num,
    required this.price,
    required this.total,
    required this.productPic,
    required this.productAmount,
  });

  factory CartViewModel.fromJson(Map<String, dynamic> json) => CartViewModel(
        cartId: json["cart_id"] == null ? null : json["cart_id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        productId: json["product_id"] == null ? null : json["product_id"],
        productName: json["product_name"] == null ? null : json["product_name"],
        num: json["num"] == null ? null : json["num"],
        price: json["price"] == null ? null : json["price"],
        total: json["total"] == null ? null : json["total"],
        productPic: json["product_pic"] == null ? null : json["product_pic"],
        productAmount:
            json["product_amount"] == null ? null : json["product_amount"],
      );

  Map<String, dynamic> toJson() => {
        "cart_id": cartId == null ? null : cartId,
        "user_id": userId == null ? null : userId,
        "product_id": productId == null ? null : productId,
        "product_name": productName == null ? null : productName,
        "num": num == null ? null : num,
        "price": price == null ? null : price,
        "total": total == null ? null : total,
        "product_pic": productPic == null ? null : productPic,
        "product_amount": productAmount == null ? null : productAmount,
      };
}
