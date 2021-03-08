import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class SelectedBadge extends StatelessWidget {
  final bool show;
  final Widget child;

  const SelectedBadge({Key key, this.show, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Badge(
      position: BadgePosition.topEnd(top: 4, end: 4),
      padding: EdgeInsets.all(2.5),
      elevation: 0,
      shape: BadgeShape.square,
      animationDuration: Duration.zero,
      borderRadius: BorderRadius.circular(4),
      badgeContent: Text(
        '已選',
        style: TextStyle(color: Colors.white),
      ),
      showBadge: show,
      child: child,
    );
  }
}
