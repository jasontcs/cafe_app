import 'package:cafe_app/constant/constant.dart';
import 'package:cafe_app/models/table_model.dart';
import 'package:cafe_app/pages/tables/components/selected_badge.dart';
import 'package:cafe_app/providers/table.dart';
import 'package:cafe_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import 'table_bottom_sheet.dart';

class TableGridTile extends StatelessWidget {
  final CafeTable table;

  const TableGridTile({Key key, this.table}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Duration duration = table.customer != null
        ? DateTime.now().difference(table.customer.created)
        : null;

    String status = table.customer?.status ?? 'free';
    bool isSelected = table.customer != null &&
        context.watch<TableProvider>().selectedTable?.customer?.id ==
            table.customer?.id;

    return SelectedBadge(
      show: isSelected,
      child: Card(
        elevation: 5,
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Positioned(
              child: GridTile(
                header: GridTileBar(
                  title: Text(
                    Constant.tableStatus[status]['name'],
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    border: isSelected
                        ? Border.all(
                            color: Theme.of(context).accentColor, width: 3)
                        : null,
                    color: Constant.tableStatus[status]['color'],
                  ),
                  child: Center(
                    child: Text(
                      table.name.toUpperCase(),
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                ),
                footer: GridTileBar(
                  title: Text(
                    duration != null ? "${duration.inMinutes}分" : '',
                    style: TextStyle(color: Colors.black45),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: table.customer?.status == 'activated'
                      ? () {
                          context.read<TableProvider>().selectedTable = table;
                          Navigator.of(context).pushNamed('/main');
                        }
                      : () => showAppSnackBar(context, '不適用'),
                  onLongPress: () => showMaterialModalBottomSheet(
                      context: context,
                      builder: (context) => TableBottomSheet(table: table)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
