import 'package:flutter/material.dart';
import 'package:cafe_app/models/menu_model.dart';

class OptionsItem extends StatefulWidget {
  final Attribute attribute;
  final Function({String selected}) didSelected;

  const OptionsItem({
    Key key,
    this.attribute,
    this.didSelected,
  });

  @override
  _OptionsItemState createState() => _OptionsItemState();
}

class _OptionsItemState extends State<OptionsItem> {
  int _value;

  @override
  initState() {
    _value = widget.attribute.defaultOption != null
        ? widget.attribute.options.indexOf(widget.attribute.defaultOption)
        : 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 8, 32, 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.attribute.name,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          Wrap(
            spacing: 8,
            children: widget.attribute.options
                .asMap()
                .entries
                .map(
                  (option) => ChoiceChip(
                    label: Text(option.value),
                    selected: _value == option.key,
                    onSelected: (bool selected) {
                      setState(() {
                        _value = option.key;
                        widget.didSelected(selected: option.value);
                      });
                    },
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
