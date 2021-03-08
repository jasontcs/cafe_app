import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TokenQrModal extends StatelessWidget {
  TokenQrModal({Key key}) : super(key: key);

  TokenQrModal.show(context) {
    showBarModalBottomSheet(
        context: context,
        builder: (context) => TokenQrModal(
              key: key,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_down),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Theme.of(context).accentColor,
        title: Text('QR Code 開枱'),
      ),
      body: Center(
        child: NamedQrColumn(),
      ),
    );
  }
}

class NamedQrColumn extends StatelessWidget {
  const NamedQrColumn({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        QrImage(
          data: "1234567890",
          version: QrVersions.auto,
          size: 200.0,
        ),
        Text(
          'data',
          style: Theme.of(context).textTheme.headline5,
        )
      ],
    );
  }
}
