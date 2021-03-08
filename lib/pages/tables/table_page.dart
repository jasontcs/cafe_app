import 'package:cafe_app/constant/constant.dart';
import 'package:cafe_app/models/table_model.dart';
import 'package:cafe_app/pages/components/app_bar.dart';
import 'package:cafe_app/providers/table.dart';
import 'package:cafe_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/tables_grid.dart';

class TablePage extends StatefulWidget {
  @override
  _TablePageState createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<TableProvider>(context, listen: false).refreshTables();
  }

  @override
  Widget build(BuildContext context) {
    List<TableType> tables = context.watch<TableProvider>().tables;

    Widget body = tables.length == 0 ?? true
        ? Center(child: CircularProgressIndicator())
        : TabBarView(
            children: tables
                .map((TableType type) => TablesGrid(
                      type: type,
                      spacing: 8,
                      onTap: (table) {
                        if (table.customer?.status == 'activated') {
                          context.read<TableProvider>().selectedTable = table;
                        } else {
                          showAppSnackBar(context, '不適用');
                        }
                      },
                      onRefresh: () =>
                          context.read<TableProvider>().refreshTables(),
                    ))
                .toList(),
          );
    return DefaultTabController(
      length: tables.length,
      child: Scaffold(
        appBar: buildAppBar(
          title: '餐桌',
          context: context,
          actions: context.watch<TableProvider>().selectedTable != null
              ? [
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    onPressed: () => Navigator.of(context).pushNamed('/main'),
                  )
                ]
              : null,
          bottom: TabBar(
            tabs: tables.map((TableType type) => Tab(text: type.name)).toList(),
          ),
        ),
        body: AnimatedSwitcher(
          duration: Constant.animatedSwitcherDuration,
          child: body,
        ),
      ),
    );
  }
}
