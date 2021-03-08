// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) {
  return OrderModel(
    token: json['token'] as String,
    note: json['note'] as String,
    products: (json['products'] as List)
        ?.map((e) =>
            e == null ? null : OrderProduct.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    fees: (json['fees'] as List)
        ?.map((e) =>
            e == null ? null : OrderFee.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    coupons: (json['coupons'] as List)
        ?.map((e) =>
            e == null ? null : OrderCoupon.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    id: json['id'] as int,
    status: json['status'] as String,
    created: json['date_created'] == null
        ? null
        : DateTime.parse(json['date_created'] as String),
    modified: json['date_modified'] == null
        ? null
        : DateTime.parse(json['date_modified'] as String),
    discountTotal: (json['discount_total'] as num)?.toDouble(),
    total: (json['total'] as num)?.toDouble(),
    customerId: json['customer_id'] as int,
  );
}

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) {
  final val = <String, dynamic>{
    'token': instance.token,
    'note': instance.note,
    'products': instance.products,
    'fees': instance.fees,
    'coupons': instance.coupons,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('status', instance.status);
  writeNotNull('date_created', instance.created?.toIso8601String());
  writeNotNull('date_modified', instance.modified?.toIso8601String());
  writeNotNull('discount_total', instance.discountTotal);
  writeNotNull('total', instance.total);
  writeNotNull('customer_id', instance.customerId);
  return val;
}

OrderProduct _$OrderProductFromJson(Map<String, dynamic> json) {
  return OrderProduct(
    id: json['product_id'] as int,
    quantity: json['quantity'] as int,
    subtotal: (json['subtotal'] as num)?.toDouble(),
    total: (json['total'] as num)?.toDouble(),
    price: (json['price'] as num)?.toDouble(),
    variationId: json['variation_id'] as int,
  );
}

Map<String, dynamic> _$OrderProductToJson(OrderProduct instance) {
  final val = <String, dynamic>{
    'product_id': instance.id,
    'quantity': instance.quantity,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('subtotal', instance.subtotal);
  writeNotNull('total', instance.total);
  writeNotNull('price', instance.price);
  writeNotNull('variation_id', instance.variationId);
  return val;
}

OrderFee _$OrderFeeFromJson(Map<String, dynamic> json) {
  return OrderFee(
    name: json['name'] as String,
    total: (json['total'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$OrderFeeToJson(OrderFee instance) => <String, dynamic>{
      'name': instance.name,
      'total': instance.total,
    };

OrderCoupon _$OrderCouponFromJson(Map<String, dynamic> json) {
  return OrderCoupon(
    code: json['code'] as String,
    discount: (json['discount'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$OrderCouponToJson(OrderCoupon instance) {
  final val = <String, dynamic>{
    'code': instance.code,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('discount', instance.discount);
  return val;
}
