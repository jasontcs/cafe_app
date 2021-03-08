import 'package:cafe_app/providers/cart.dart';
import 'package:cafe_app/providers/table.dart';
import 'package:cafe_app/services/dialog.dart';
import 'package:cafe_app/services/http.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlaceOrderButton extends StatelessWidget {
  const PlaceOrderButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: Theme.of(context).primaryColor,
      onPressed: () => AppDialog.confirm(
        context,
        title: '確定下單？',
        subtitle: '一經確定不能更改',
      ).then((confirmed) => AppHttp().postOrder().then((_) {
            context.read<CartProvider>().clearCart();
            context.read<TableProvider>().selectedTable = null;
            Navigator.of(context).popUntil((route) => route.isFirst);
          })),
      icon: Icon(Icons.send),
      label: Text(
        '下單',
      ),
      tooltip: '購物車',
    );
  }
}
