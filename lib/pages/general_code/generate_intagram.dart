import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:master_scanner_app/common/widgets/result_appbar.dart';
import 'package:master_scanner_app/gen/assets.gen.dart';
import 'package:master_scanner_app/pages/general_code/common/generate_single_input.dart';

class GenerateInstagram extends StatefulWidget {
  const GenerateInstagram({super.key});

  @override
  State<GenerateInstagram> createState() => _GenerateInstagramState();
}

class _GenerateInstagramState extends State<GenerateInstagram> {
  _GenerateInstagramState();

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: GenerateSingleInputPage(
          iconPath: Assets.icons.iconInsta,
          appBarLabel: 'generate.instagram'.tr(),
          inputLabel: 'generate.instagram_label'.tr(),
          inputHint: 'generate.instagram_hint'.tr(),
          onClick: (data) {
            Get.back();
          },
          controller: controller,
        ),
        appBar: ResultAppBar(
          title: 'generate.instagram'.tr(),
          action: () {
            Get.back();
          },
          icon: Assets.icons.iconInsta,
        ),
      );
}
