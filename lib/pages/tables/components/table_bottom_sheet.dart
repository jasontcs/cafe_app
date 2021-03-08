import 'package:cafe_app/models/table_model.dart';
// import 'package:cafe_app/pages/token_qr/token_qr.dart';
import 'package:cafe_app/providers/table.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TableBottomSheet extends StatelessWidget {
  final CafeTable table;

  const TableBottomSheet({Key key, this.table}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String status = table.customer?.status ?? 'free';

    return Material(
        child: SafeArea(
      top: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TableBottomSheetItem(
            title: '點餐',
            icon: Icons.edit,
            enabled: status == 'activated',
            onTap: () {
              context.read<TableProvider>().selectedTable = table;
              Navigator.of(context).pushNamed('/main');
            },
          ),
          TableBottomSheetItem(
            title: 'QR Code 開枱',
            icon: Icons.qr_code,
            enabled: status == 'created',
            // onTap: () => TokenQrModal.show(context),
          ),
          Divider(
              // height: 1,
              // thickness: 1,
              ),
          TableBottomSheetItem(
            title: '開枱',
            icon: Icons.edit,
            enabled: status == 'free',
            onTap: () => context.read<TableProvider>().createTable(table),
          ),
          TableBottomSheetItem(
            title: '入座',
            icon: Icons.edit,
            enabled: status == 'created',
            onTap: () => context.read<TableProvider>().activateTable(table),
          ),
          TableBottomSheetItem(
            title: '結帳',
            icon: Icons.edit,
            enabled: status == 'activated',
            onTap: () => context.read<TableProvider>().checkoutTable(table),
          ),
        ],
      ),
    ));
  }
}

class TableBottomSheetItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool enabled;
  final Function() onTap;

  const TableBottomSheetItem({
    Key key,
    this.title,
    this.icon,
    this.onTap,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      enabled: enabled,
      title: Text(title),
      leading: Icon(icon),
      onTap: () {
        Navigator.of(context).pop();
        onTap();
      },
    );
  }
}
