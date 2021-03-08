import 'package:cafe_app/models/cart_item.dart';
import 'package:cafe_app/providers/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    Key key,
    this.item,
  }) : super(key: key);

  final CartItem item;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        context.read<CartProvider>().addProductToCart(item);
        Navigator.of(context).pop();
      },
      icon: Icon(Icons.add_shopping_cart),
      label: Text(
        '加到購物車',
      ),
      tooltip: '購物車',
    );
  }
}
