import 'package:flutter/material.dart';

class AppDialog {
  static Future<bool> confirm(BuildContext context,
      {String title, String subtitle}) async {
    AlertDialog dialog = AlertDialog(
      title: Text(title),
      content: Text(subtitle),
      actions: [
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: Text('取消'),
        ),
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: Text('確定'),
        ),
      ],
    );

    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => dialog,
    );
  }
}
