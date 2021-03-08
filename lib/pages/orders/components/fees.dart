import 'package:cafe_app/utils/utils.dart';
import 'package:flutter/material.dart';

List<Widget> buildFees(Map<String, double> feeMap) => feeMap.entries
    .map((e) => ListTile(
          title: Text(e.key),
          trailing: Text(priceToString(e.value)),
        ))
    .toList();
