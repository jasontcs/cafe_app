import 'package:cafe_app/models/cart_item.dart';
import 'package:cafe_app/providers/cart.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import 'item.dart';

class ShoppingCartItemsList extends StatelessWidget {
  const ShoppingCartItemsList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CartItem> shoppingCart = context.watch<CartProvider>().shoppingCart;

    return ListView.builder(
      shrinkWrap: true,
      controller: ModalScrollController.of(context),
      physics: ClampingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) => Column(
        children: [
          ShoppingCartListItem(
            item: shoppingCart[index],
            onPressed: () =>
                context.read<CartProvider>().removeItemFromCart(index),
          ),
          Divider(
            color: Colors.grey,
            thickness: 1,
            indent: 80,
            endIndent: 16,
          ),
        ],
      ),
      itemCount: shoppingCart.length,
    );
  }
}
