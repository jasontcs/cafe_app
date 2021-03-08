import 'package:cafe_app/models/order_model.dart';
import 'package:cafe_app/models/table_model.dart';
import 'package:cafe_app/services/http.dart';
import 'package:flutter/material.dart';

class TableProvider with ChangeNotifier {
  List<TableType> tables = <TableType>[];

  Future<List<TableType>> refreshTables() async {
    await AppHttp().getTables().then((result) {
      tables = result;
      notifyListeners();
    });
    return tables;
  }

  CafeTable _selectedTable;
  CafeTable get selectedTable => _selectedTable;
  set selectedTable(CafeTable table) {
    _selectedTable = table;
    notifyListeners();
  }

  CafeTable getTableByToken(String token) => tables
      .expand((type) => type.tables)
      .singleWhere((table) => table.customer?.token == token, orElse: null);

  Future<TableType> createTable(CafeTable table) async {
    TableType returnTable =
        await AppHttp().updateTable(name: table.name, status: 'create');
    await refreshTables();
    return returnTable;
  }

  Future<TableType> activateTable(CafeTable table) async {
    TableType returnTable = await AppHttp()
        .updateTable(token: table.customer.token, status: 'activate');
    await refreshTables();
    return returnTable;
  }

  Future<TableType> checkoutTable(CafeTable table) async {
    TableType returnTable = await AppHttp()
        .updateTable(token: table.customer.token, status: 'finish');
    await refreshTables();
    return returnTable;
  }

  List<OrderModel> orders = <OrderModel>[];

  Future<void> refreshOrders() async {
    if (_selectedTable?.customer == null) return;
    await AppHttp().getOrder(_selectedTable?.customer).then((result) {
      orders = result;
      notifyListeners();
    });
  }
}
