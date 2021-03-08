import 'package:cafe_app/pages/shopping_cart/components/place_order_button.dart';
import 'package:flutter/material.dart';

import 'items_list.dart';
import 'summary.dart';

class ShoppingCartBody extends StatelessWidget {
  const ShoppingCartBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          ShoppingCartItemsList(),
          ShoppingCartSummary(),
        ],
      ),
    );
  }
}
