import 'package:cafe_app/models/table_model.dart';
import 'package:cafe_app/pages/tables/components/tables_grid_tile.dart';
import 'package:flutter/material.dart';

class TablesGrid extends StatelessWidget {
  final TableType type;
  final double spacing;
  final Function(CafeTable table) onTap;
  final Function() onRefresh;

  const TablesGrid({
    Key key,
    this.type,
    this.spacing,
    this.onTap,
    this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: spacing,
        crossAxisSpacing: spacing,
        padding: EdgeInsets.all(spacing),
        childAspectRatio: 1,
        children: type.tables
            .map((CafeTable table) => TableGridTile(
                  table: table,
                ))
            .toList(),
      ),
      onRefresh: onRefresh,
    );
  }
}
