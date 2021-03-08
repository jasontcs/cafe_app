import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'menu_model.g.dart';

@JsonSerializable()
class MenuCategory {
  @JsonKey(name: 'category_id')
  final int id;
  final String name;
  List<Product> products;

  MenuCategory({this.id, this.name, List<Product> products})
      : products = products ?? <Product>[];

  factory MenuCategory.fromJson(Map<String, dynamic> json) =>
      _$MenuCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$MenuCategoryToJson(this);
}

@JsonSerializable()
class Product {
  @JsonKey(name: 'product_id')
  final int id;
  final String name;
  final String description;
  final double price;
  final bool purchasable;
  @JsonKey(name: 'image_url')
  final String imageUrl;
  List<Attribute> attributes;
  List<Variation> variations;

  Product(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.purchasable,
      this.imageUrl,
      List<Attribute> attributes,
      List<Variation> variations})
      : attributes = attributes ?? <Attribute>[],
        variations = variations ?? <Variation>[];

  Variation getVariationByAttributes(List<String> attributes) =>
      variations.singleWhere(
        (variation) => listEquals(variation.attributes, attributes),
        orElse: () => null,
      );

  Variation getVariationById(int id) => variations.singleWhere(
        (variation) => variation.id == id,
        orElse: () => null,
      );

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@JsonSerializable()
class Attribute {
  final String name;
  List<String> options;
  @JsonKey(name: 'default')
  final String defaultOption;

  Attribute({this.name, List<String> options, this.defaultOption})
      : options = options ?? <String>[];

  factory Attribute.fromJson(Map<String, dynamic> json) =>
      _$AttributeFromJson(json);

  Map<String, dynamic> toJson() => _$AttributeToJson(this);
}

@JsonSerializable()
class Variation {
  @JsonKey(name: 'variation_id')
  final int id;
  final double price;
  final bool purchasable;
  List<String> attributes;

  Variation({this.id, this.price, this.purchasable, List<String> attributes})
      : attributes = attributes ?? <String>[];
  factory Variation.fromJson(Map<String, dynamic> json) =>
      _$VariationFromJson(json);

  Map<String, dynamic> toJson() => _$VariationToJson(this);
}
