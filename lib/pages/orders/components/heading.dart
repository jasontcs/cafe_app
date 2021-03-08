import 'package:flutter/material.dart';

class HeadingItem extends StatelessWidget {
  final String heading;

  const HeadingItem(this.heading, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
      child: Text(
        heading,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }
}
