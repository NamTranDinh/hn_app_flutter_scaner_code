import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:master_scanner_app/common/widgets/result_appbar.dart';
import 'package:master_scanner_app/gen/assets.gen.dart';
import 'package:master_scanner_app/pages/general_code/common/generate_single_input.dart';

class GenerateWeb extends StatefulWidget {
  const GenerateWeb({super.key});

  @override
  _GenerateWebState createState() => _GenerateWebState();
}

class _GenerateWebState extends State<GenerateWeb> {
  _GenerateWebState();

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: GenerateSingleInputPage(
          iconPath: Assets.icons.iconWeb,
          appBarLabel: 'generate.website'.tr(),
          inputLabel: 'generate.website_lb'.tr(),
          inputHint: 'generate.website_ht'.tr(),
          onClick: (data) {
            Get.back();
          },
          controller: controller,
          validate: (String? v) => null,
        ),
        extendBodyBehindAppBar: true,
        appBar: ResultAppBar(
          title: 'generate.website'.tr(),
          action: () {
            Get.back();
          },
          icon: Assets.icons.iconBack,
        ),
      );
}
