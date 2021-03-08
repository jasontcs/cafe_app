import 'package:cafe_app/pages/shopping_cart/shopping_cart.dart';
import 'package:cafe_app/providers/cart.dart';
import 'package:cafe_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShoppingCartAction extends StatelessWidget {
  const ShoppingCartAction({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(priceToString(context.watch<CartProvider>().totalCost)),
        IconButton(
          icon: Icon(Icons.shopping_cart),
          tooltip: '購物車',
          onPressed: () {
            ShoppingCartModal.show(
              title: '購物車',
              context: context,
            );
          },
        ),
      ],
    );
  }
}
