import 'package:cafe_app/models/cart_item.dart';
import "package:flutter/foundation.dart";
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  List<CartItem> shoppingCart = [];
  void addProductToCart(CartItem item) {
    shoppingCart.add(item);
    notifyListeners();
  }

  void removeItemFromCart(int index) {
    shoppingCart.removeAt(index);
    notifyListeners();
  }

  void clearCart() {
    shoppingCart = [];
    // shoppingCart.clear();
    notifyListeners();
  }

  double get totalCost =>
      shoppingCart.fold(0.0, (sum, item) => sum + item.price);
}
