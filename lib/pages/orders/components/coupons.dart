import 'package:cafe_app/models/order_model.dart';
import 'package:cafe_app/providers/table.dart';
import 'package:cafe_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<Widget> buildCoupons(BuildContext context) => context
    .select((TableProvider p) => p.orders)
    .expand((OrderModel order) =>
        order.coupons.map((OrderCoupon coupon) => ListTile(
              title: Text(coupon.code),
              trailing: Text(priceToString(-coupon.discount)),
            )))
    .toList();
