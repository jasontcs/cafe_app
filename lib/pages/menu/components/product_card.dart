import 'package:cafe_app/models/menu_model.dart';
import 'package:cafe_app/pages/components/card_button.dart';
import 'package:cafe_app/pages/product_detail/product_detail_page.dart';
import 'package:cafe_app/utils/utils.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  ProductCard({
    Key key,
    this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return CardButton(
      child: GridTile(
        child: Hero(
          tag: 'image.${product.id}',
          child: AppNetworkImage(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          title: Text(product.name),
          subtitle: Text("\$ ${product.price.toString()}"),
          backgroundColor: Colors.black45,
        ),
      ),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductDetailPage(
            product: product,
          ),
        ),
      ),
    );
  }
}
