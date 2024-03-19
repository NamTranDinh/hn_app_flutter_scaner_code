import 'package:flutter/material.dart';
import 'package:qr_code_scanner/common/widgets/item_qr.dart';
import 'package:qr_code_scanner/flavors.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: F.title,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Center(
          child: ItemQr(
            iconSrc: 'assets/icons/icon_wifi.svg',
            textValue: 'wifi',
            onTap: () {},
          ),
        ),
      );
}
