import 'dart:convert';

import 'package:cafe_app/models/cart_item.dart';
import 'package:cafe_app/models/order_model.dart';
import 'package:cafe_app/models/table_model.dart';
import 'package:cafe_app/providers/cart.dart';
import 'package:cafe_app/providers/table.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:cafe_app/models/menu_model.dart';
import 'package:provider/provider.dart';

class AppHttp {
  BuildContext _context;

  static final AppHttp _singleton = AppHttp._internal();

  factory AppHttp() {
    return _singleton;
  }

  void init(BuildContext context) => _context = context;

  AppHttp._internal();

  static String prefix = 'http://35.212.207.73/cafe-web/';

  Future<List<MenuCategory>> getMenu() async {
    Response res = await get(prefix + 'menu');

    return (json.decode(res.body) as List)
        .map((i) => MenuCategory.fromJson(i))
        .toList();
  }

  Future<List<TableType>> getTables() async {
    Response res = await get(prefix + 'table');

    return (json.decode(res.body) as List)
        .map((i) => TableType.fromJson(i))
        .toList();
  }

  Future<TableType> updateTable(
      {String name, String token, String status}) async {
    Response res;

    switch (status) {
      case 'create':
        res = await post(
          prefix + 'customer',
          body: {'table': name},
        );
        break;
      case 'activate':
        res = await put(
          prefix + 'customer?token=' + token,
        );

        break;
      case 'finish':
        res = await delete(
          prefix + 'customer?token=' + token,
        );
        break;
      default:
    }

    return TableType.fromJson(json.decode(res.body));
  }

  Future<OrderModel> postOrder() async {
    List<CartItem> cart = _context.read<CartProvider>().shoppingCart;
    double serviceCharge = _context.read<CartProvider>().totalCost;
    Customer customer = _context.read<TableProvider>().selectedTable?.customer;

    if (cart.isEmpty || customer == null) return null;

    OrderModel order = OrderModel(
      token: customer.token,
      note: 'app',
      products: cart
          .map(
            (item) => OrderProduct(
              id: item.variationId ?? item.productId,
              quantity: 1,
            ),
          )
          .toList(),
      fees: [
        OrderFee(name: '膠袋', total: 0.5),
        OrderFee(name: '加一', total: serviceCharge * 0.1),
      ],
      coupons: [
        OrderCoupon(code: 'breakfast'),
      ],
    );

    Response res = await post(
      prefix + 'order',
      headers: {"Content-Type": "application/json"},
      body: json.encode(order.toJson()),
    );

    return OrderModel.fromJson(json.decode(res.body));
  }

  Future<List<OrderModel>> getOrder(Customer customer) async {
    Response res = await get(prefix + 'order?token=' + customer.token);

    return (json.decode(res.body) as List)
        .map((i) => OrderModel.fromJson(i))
        .toList();
  }
}
