import 'package:flutter/material.dart';
import 'package:master_scanner_app/common/widgets/appbar.dart';
import 'package:master_scanner_app/core/app_color.dart';

class GeneratePage extends StatelessWidget {
  const GeneratePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColor.grey,
        appBar: CustomAppBar(
          title: 'Generate',
          action: () {},
        ),
        body: const Center(child: Text('Hello Generate Page')),
      );
}
