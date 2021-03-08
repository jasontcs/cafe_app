import 'package:cafe_app/models/cart_item.dart';
import 'package:cafe_app/models/menu_model.dart';
import 'package:cafe_app/providers/menu.dart';
import 'package:cafe_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShoppingCartListItem extends StatelessWidget {
  final CartItem item;
  final bool hideRemoveButton;
  final Function() onPressed;
  const ShoppingCartListItem({
    Key key,
    this.item,
    this.onPressed,
    this.hideRemoveButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Product product =
        context.watch<MenuProvider>().getProductById(item.productId);
    Variation variation = product.getVariationById(item.variationId);
    double price = variation?.price ?? product.price;

    return ListTile(
      leading: hideRemoveButton
          ? null
          : IconButton(
              icon: Icon(
                Icons.remove_circle,
                color: Colors.blueGrey,
                size: 28,
              ),
              onPressed: onPressed,
            ),
      title: Text(product.name),
      subtitle: Text(variation?.attributes?.join(', ') ?? ''),
      trailing: Text(priceToString(price)),
      // onTap: () {},
    );
  }
}
