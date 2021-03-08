import 'package:cafe_app/providers/cart.dart';
import 'package:cafe_app/services/dialog.dart';
import 'package:cafe_app/services/http.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import 'components/body.dart';
import 'components/place_order_button.dart';

class ShoppingCartModal extends StatelessWidget {
  final String title;

  ShoppingCartModal({Key key, this.title}) : super(key: key);

  ShoppingCartModal.show({context, this.title}) {
    showBarModalBottomSheet(
        context: context,
        builder: (context) => ShoppingCartModal(
              key: key,
              title: title,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_down),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () => context.read<CartProvider>().clearCart(),
          ),
        ],
        backgroundColor: Theme.of(context).accentColor,
        title: Text(title),
      ),
      body: ShoppingCartBody(),
      floatingActionButton: PlaceOrderButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
