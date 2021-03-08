import 'package:cafe_app/models/menu_model.dart';
import 'package:flutter/material.dart';

import 'options_item.dart';

class ProductOptions extends StatelessWidget {
  ProductOptions({Key key, this.attributes, this.variations, this.didSelected});

  final List<Attribute> attributes;
  final List<Variation> variations;
  final Function({int index, String selected}) didSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: attributes
          .asMap()
          .entries
          .map((attribute) => OptionsItem(
                attribute: attribute.value,
                didSelected: ({String selected}) =>
                    didSelected(index: attribute.key, selected: selected),
              ))
          .toList(),
    );
  }
}
