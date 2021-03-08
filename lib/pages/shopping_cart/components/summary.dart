import 'package:cafe_app/providers/cart.dart';
import 'package:provider/provider.dart';
import 'package:cafe_app/utils/utils.dart';
import 'package:flutter/material.dart';

class ShoppingCartSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 80, end: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '總計：',
            style: Theme.of(context).textTheme.headline4,
          ),
          Expanded(
            child: Text(
              priceToString(context.watch<CartProvider>().totalCost),
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
