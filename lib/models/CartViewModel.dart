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
        cartId: json["cart_id"],
        userId: json["user_id"],
        productId: json["product_id"],
        productName: json["product_name"],
        num: json["num"],
        price: json["price"],
        total: json["total"],
        productPic: json["product_pic"],
        productAmount: json["product_amount"],
      );

  Map<String, dynamic> toJson() => {
        "cart_id": cartId,
        "user_id": userId,
        "product_id": productId,
        "product_name": productName,
        "num": num,
        "price": price,
        "total": total,
        "product_pic": productPic,
        "product_amount": productAmount,
      };
}
