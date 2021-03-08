// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuCategory _$MenuCategoryFromJson(Map<String, dynamic> json) {
  return MenuCategory(
    id: json['category_id'] as int,
    name: json['name'] as String,
    products: (json['products'] as List)
        ?.map((e) =>
            e == null ? null : Product.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MenuCategoryToJson(MenuCategory instance) =>
    <String, dynamic>{
      'category_id': instance.id,
      'name': instance.name,
      'products': instance.products,
    };

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
    id: json['product_id'] as int,
    name: json['name'] as String,
    description: json['description'] as String,
    price: (json['price'] as num)?.toDouble(),
    purchasable: json['purchasable'] as bool,
    imageUrl: json['image_url'] as String,
    attributes: (json['attributes'] as List)
        ?.map((e) =>
            e == null ? null : Attribute.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    variations: (json['variations'] as List)
        ?.map((e) =>
            e == null ? null : Variation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'product_id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'purchasable': instance.purchasable,
      'image_url': instance.imageUrl,
      'attributes': instance.attributes,
      'variations': instance.variations,
    };

Attribute _$AttributeFromJson(Map<String, dynamic> json) {
  return Attribute(
    name: json['name'] as String,
    options: (json['options'] as List)?.map((e) => e as String)?.toList(),
    defaultOption: json['default'] as String,
  );
}

Map<String, dynamic> _$AttributeToJson(Attribute instance) => <String, dynamic>{
      'name': instance.name,
      'options': instance.options,
      'default': instance.defaultOption,
    };

Variation _$VariationFromJson(Map<String, dynamic> json) {
  return Variation(
    id: json['variation_id'] as int,
    price: (json['price'] as num)?.toDouble(),
    purchasable: json['purchasable'] as bool,
    attributes: (json['attributes'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$VariationToJson(Variation instance) => <String, dynamic>{
      'variation_id': instance.id,
      'price': instance.price,
      'purchasable': instance.purchasable,
      'attributes': instance.attributes,
    };
