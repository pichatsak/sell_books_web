class DeliTypeModel {
  int deliveryId;
  String deliveryName;
  int deliveryPrice;
  String deliveryCreate;
  String deliveryUpdate;

  DeliTypeModel({
    required this.deliveryId,
    required this.deliveryName,
    required this.deliveryPrice,
    required this.deliveryCreate,
    required this.deliveryUpdate,
  });

  factory DeliTypeModel.fromJson(Map<String, dynamic> json) => DeliTypeModel(
        deliveryId: json["delivery_id"],
        deliveryName: json["delivery_name"],
        deliveryPrice: json["delivery_price"],
        deliveryCreate: json["delivery_create"],
        deliveryUpdate: json["delivery_update"],
      );

  Map<String, dynamic> toJson() => {
        "delivery_id": deliveryId,
        "delivery_name": deliveryName,
        "delivery_price": deliveryPrice,
        "delivery_create": deliveryCreate,
        "delivery_update": deliveryUpdate,
      };
}
