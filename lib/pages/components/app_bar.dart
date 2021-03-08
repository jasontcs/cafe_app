import 'package:cafe_app/providers/table.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

AppBar buildAppBar(
    {BuildContext context,
    Widget leading,
    List<Widget> actions,
    String title,
    PreferredSizeWidget bottom}) {
  return AppBar(
    leading: leading,
    title: Text(title ??
        context.watch<TableProvider>().selectedTable?.name?.toUpperCase() ??
        ''),
    actions: actions,
    bottom: bottom,
  );
}
