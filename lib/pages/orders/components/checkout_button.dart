import 'package:flutter/material.dart';

class CheckOutButton extends StatelessWidget {
  const CheckOutButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {},
      icon: Icon(Icons.credit_card),
      label: Text(
        '結帳',
      ),
      tooltip: '結帳',
    );
  }
}
