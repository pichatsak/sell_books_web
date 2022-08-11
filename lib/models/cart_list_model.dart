import 'dart:convert';

class CartListModel {
  int cartId;
  int productId;
  int num;
  CartListModel({
    required this.cartId,
    required this.productId,
    required this.num,
  });

  CartListModel copyWith({
    int? cartId,
    int? productId,
    int? num,
  }) {
    return CartListModel(
      cartId: cartId ?? this.cartId,
      productId: productId ?? this.productId,
      num: num ?? this.num,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cartId': cartId,
      'productId': productId,
      'num': num,
    };
  }

  factory CartListModel.fromMap(Map<String, dynamic> map) {
    return CartListModel(
      cartId: map['cartId']?.toInt() ?? 0,
      productId: map['productId']?.toInt() ?? 0,
      num: map['num']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartListModel.fromJson(String source) =>
      CartListModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'CartListModel(cartId: $cartId, productId: $productId, num: $num)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CartListModel &&
        other.cartId == cartId &&
        other.productId == productId &&
        other.num == num;
  }

  @override
  int get hashCode => cartId.hashCode ^ productId.hashCode ^ num.hashCode;
}
