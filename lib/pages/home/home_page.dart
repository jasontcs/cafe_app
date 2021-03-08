import 'package:cafe_app/models/table_model.dart';
import 'package:cafe_app/pages/orders/orders_body.dart';
import 'package:cafe_app/providers/menu.dart';
import 'package:cafe_app/providers/table.dart';
import 'package:cafe_app/services/http.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../menu/menu_body.dart';
import 'components/bottom_bar.dart';

class MainPage extends StatefulWidget {
  final String token;
  MainPage({Key key, this.token}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  List<Widget> bodyList;
  List<PreferredSizeWidget> appBarBottom;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    // print(Uri.base);
    // print(widget.token);

    TableProvider tableProvider =
        Provider.of<TableProvider>(context, listen: false);
    if (widget.token != null) {
      tableProvider.refreshTables().then((tableObj) => tableProvider
          .activateTable(tableProvider.getTableByToken(widget.token))
          .then((_) => Provider.of<TableProvider>(context, listen: true)
              .selectedTable = tableProvider.getTableByToken(widget.token)));
    }

    Provider.of<MenuProvider>(context, listen: false).refreshMenu();
  }

  @override
  Widget build(BuildContext context) {
    AppHttp().init(context);

    bodyList = [
      MenuBody(),
      OrdersBody(),
    ];

    return Scaffold(
      body: bodyList[_selectedIndex],
      bottomNavigationBar: AppBottomBar(
        initIndex: _selectedIndex,
        onItemTapped: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
