import 'package:flutter/material.dart';

class CardButton extends StatelessWidget {
  const CardButton({
    Key key,
    this.child,
    this.onTap,
  }) : super(key: key);

  final Widget child;
  final Function() onTap;
  // final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned(
            child: child,
          ),
          Positioned.fill(
              child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: onTap,
                  ))),
        ],
      ),
    );
  }
}
