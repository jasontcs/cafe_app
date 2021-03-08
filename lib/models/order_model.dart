import 'package:json_annotation/json_annotation.dart';

part 'order_model.g.dart';

@JsonSerializable()
class OrderModel {
  final String token;
  final String note;
  List<OrderProduct> products;
  List<OrderFee> fees;
  List<OrderCoupon> coupons;

  @JsonKey(includeIfNull: false)
  final int id;
  @JsonKey(includeIfNull: false)
  final String status;
  @JsonKey(includeIfNull: false, name: 'date_created')
  final DateTime created;
  @JsonKey(includeIfNull: false, name: 'date_modified')
  final DateTime modified;
  @JsonKey(includeIfNull: false, name: 'discount_total')
  final double discountTotal;
  @JsonKey(includeIfNull: false)
  final double total;
  @JsonKey(includeIfNull: false, name: 'customer_id')
  final int customerId;

  OrderModel({
    this.token,
    this.note,
    List<OrderProduct> products,
    List<OrderFee> fees,
    List<OrderCoupon> coupons,
    this.id,
    this.status,
    this.created,
    this.modified,
    this.discountTotal,
    this.total,
    this.customerId,
  })  : products = products ?? <OrderProduct>[],
        fees = fees ?? <OrderFee>[],
        coupons = coupons ?? <OrderCoupon>[];

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}

@JsonSerializable()
class OrderProduct {
  @JsonKey(name: 'product_id')
  final int id;
  final int quantity;

  @JsonKey(includeIfNull: false)
  final double subtotal;
  @JsonKey(includeIfNull: false)
  final double total;
  @JsonKey(includeIfNull: false)
  final double price;
  @JsonKey(includeIfNull: false, name: 'variation_id')
  final int variationId;

  OrderProduct({
    this.id,
    this.quantity,
    this.subtotal,
    this.total,
    this.price,
    this.variationId,
  });

  factory OrderProduct.fromJson(Map<String, dynamic> json) =>
      _$OrderProductFromJson(json);

  Map<String, dynamic> toJson() => _$OrderProductToJson(this);
}

@JsonSerializable()
class OrderFee {
  final String name;
  final double total;

  OrderFee({this.name, this.total});

  factory OrderFee.fromJson(Map<String, dynamic> json) =>
      _$OrderFeeFromJson(json);

  Map<String, dynamic> toJson() => _$OrderFeeToJson(this);
}

@JsonSerializable()
class OrderCoupon {
  final String code;

  @JsonKey(includeIfNull: false)
  final double discount;

  OrderCoupon({
    this.code,
    this.discount,
  });

  factory OrderCoupon.fromJson(Map<String, dynamic> json) =>
      _$OrderCouponFromJson(json);

  Map<String, dynamic> toJson() => _$OrderCouponToJson(this);
}
