import 'package:cafe_app/models/menu_model.dart';
import 'package:flutter/material.dart';

import 'product_card.dart';

class ProductsGrid extends StatelessWidget {
  final MenuCategory category;
  final double spacing;
  final Function() onRefresh;

  const ProductsGrid({
    Key key,
    this.category,
    this.spacing,
    this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: spacing,
        crossAxisSpacing: spacing,
        padding: EdgeInsets.all(spacing),
        childAspectRatio: 1,
        children: category.products
            .map(
              (Product product) => ProductCard(
                product: product,
              ),
            )
            .toList(),
      ),
      onRefresh: onRefresh,
    );
  }
}
