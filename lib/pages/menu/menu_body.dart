import 'package:cafe_app/constant/constant.dart';
import 'package:cafe_app/models/menu_model.dart';
import 'package:cafe_app/pages/components/app_bar.dart';
import 'package:cafe_app/pages/menu/components/shopping_cart_action.dart';
import 'package:cafe_app/providers/menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/products_grid.dart';

class MenuBody extends StatefulWidget {
  @override
  _MenuBodyState createState() => _MenuBodyState();
}

class _MenuBodyState extends State<MenuBody> {
  @override
  Widget build(BuildContext context) {
    List<MenuCategory> menu = context.watch<MenuProvider>().menu;

    Widget body = menu.length == 0 ?? true
        ? Center(child: CircularProgressIndicator())
        : TabBarView(
            children: menu
                .map((MenuCategory category) => ProductsGrid(
                      category: category,
                      spacing: 8,
                      onRefresh: () =>
                          Provider.of<MenuProvider>(context, listen: false)
                              .refreshMenu(),
                    ))
                .toList(),
          );
    return DefaultTabController(
      length: menu.length,
      child: Scaffold(
        appBar: buildAppBar(
          context: context,
          leading: IconButton(
            icon: Icon(Icons.event_seat),
            onPressed: () => Navigator.of(context).pop(),
          ),
          bottom: TabBar(
            tabs: menu
                .map((MenuCategory category) => Tab(
                      text: category.name,
                    ))
                .toList(),
          ),
          actions: [ShoppingCartAction()],
        ),
        body: AnimatedSwitcher(
          duration: Constant.animatedSwitcherDuration,
          child: body,
        ),
      ),
    );
  }
}
