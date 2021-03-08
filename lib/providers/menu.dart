import 'package:cafe_app/models/menu_model.dart';
import 'package:cafe_app/services/http.dart';
import 'package:flutter/material.dart';

class MenuProvider with ChangeNotifier {
  List<MenuCategory> menu = <MenuCategory>[];

  Future<List<MenuCategory>> refreshMenu() async {
    await AppHttp().getMenu().then((result) {
      menu = result;
      notifyListeners();
    });
    return menu;
  }

  Product getProductById(int id) {
    for (MenuCategory category in menu) {
      for (Product product in category.products) {
        if (product.id == id) return product;
      }
    }
    return null;
  }
}
