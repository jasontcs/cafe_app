import 'package:cafe_app/models/cart_item.dart';
import 'package:cafe_app/models/order_model.dart';
import 'package:cafe_app/pages/shopping_cart/components/item.dart';
import 'package:cafe_app/providers/table.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<Widget> buildProducts(BuildContext context) => context
    .select((TableProvider p) => p.orders)
    .expand(
      (OrderModel order) => order.products.map(
        (OrderProduct product) => ShoppingCartListItem(
          item: CartItem(
            productId: product.id,
            variationId: product.variationId,
            // price: product.total,
          ),
          hideRemoveButton: true,
        ),
      ),
    )
    .toList();
