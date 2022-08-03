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
        deliveryId: json["delivery_id"] == null ? null : json["delivery_id"],
        deliveryName:
            json["delivery_name"] == null ? null : json["delivery_name"],
        deliveryPrice:
            json["delivery_price"] == null ? null : json["delivery_price"],
        deliveryCreate:
            json["delivery_create"] == null ? null : json["delivery_create"],
        deliveryUpdate:
            json["delivery_update"] == null ? null : json["delivery_update"],
      );

  Map<String, dynamic> toJson() => {
        "delivery_id": deliveryId == null ? null : deliveryId,
        "delivery_name": deliveryName == null ? null : deliveryName,
        "delivery_price": deliveryPrice == null ? null : deliveryPrice,
        "delivery_create": deliveryCreate == null ? null : deliveryCreate,
        "delivery_update": deliveryUpdate == null ? null : deliveryUpdate,
      };
}
