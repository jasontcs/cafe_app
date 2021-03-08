import 'package:cafe_app/models/menu_model.dart';
import 'package:cafe_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'product_options.dart';

class ProductDetailBody extends StatelessWidget {
  const ProductDetailBody({
    Key key,
    @required this.product,
    this.variationPrice,
    this.didSelected,
  }) : super(key: key);

  final Product product;
  final double variationPrice;
  final Function({int index, String selected}) didSelected;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: 'image.${product.id}',
            child: AspectRatio(
              aspectRatio: 1,
              child: AppNetworkImage(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 56, 32, 8),
            child: Text(
              product.name,
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 8, 32, 8),
            child: Text(
              priceToString(variationPrice),
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          ProductOptions(
            attributes: product.attributes,
            variations: product.variations,
            didSelected: didSelected,
          ),
        ],
      ),
    );
  }
}
