import 'package:flutter/material.dart';

class Constant {
  static const Map<String, Map<String, dynamic>> tableStatus = {
    'free': {
      'name': '空置',
      'color': Colors.grey,
    },
    'created': {
      'name': '準備',
      'color': Colors.blueGrey,
    },
    'activated': {
      'name': '入座',
      'color': Colors.green,
    },
  };

  static const Duration animatedSwitcherDuration = Duration(milliseconds: 400);
}
