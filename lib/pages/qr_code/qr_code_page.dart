import 'package:flutter/material.dart';
import 'package:master_scanner_app/common/widgets/appbar.dart';
import 'package:master_scanner_app/core/app_color.dart';

class QrCodePage extends StatelessWidget {
  const QrCodePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppColor.grey,
    appBar: CustomAppBar(
      title: 'QRCodePage',
      action: () {},
    ),
    body: const Center(child: Text('Hello QRCodePage Page')),
  );
}
