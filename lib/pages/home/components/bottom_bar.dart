import 'package:cafe_app/pages/menu/components/bottom_bar_item.dart';
import 'package:cafe_app/pages/orders/components/bottom_bar_item.dart';
import 'package:cafe_app/pages/tables/components/bottom_bar_item.dart';
import 'package:flutter/material.dart';

class AppBottomBar extends StatefulWidget {
  final Function(int index) onItemTapped;
  final int initIndex;

  const AppBottomBar({
    Key key,
    this.onItemTapped,
    this.initIndex = 0,
  }) : super(key: key);

  @override
  _AppBottomBarState createState() => _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar> {
  int _selectedIndex;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      widget.onItemTapped(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    _selectedIndex = widget.initIndex;

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        MenuBottomBarItem(),
        OrdersBottomBarItem(),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Theme.of(context).accentColor,
      onTap: _onItemTapped,
    );
  }
}
