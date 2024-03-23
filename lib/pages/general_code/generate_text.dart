import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:qr_code_scanner/common/widgets/result_appbar.dart';
import 'package:qr_code_scanner/gen/assets.gen.dart';
import 'package:qr_code_scanner/pages/general_code/common/generate_single_input.dart';

class GenerateText extends StatefulWidget {
  const GenerateText({super.key});

  @override
  _GenerateTextState createState() => _GenerateTextState();
}

class _GenerateTextState extends State<GenerateText> {
  _GenerateTextState();

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: ResultAppBar(
          title: 'generate.text'.tr(),
          action: () {
            Get.back();
          },
          icon: Assets.icons.iconBack,
        ),
        body: GenerateSingleInputPage(
          iconPath: Assets.icons.iconText,
          appBarLabel: 'generate.text'.tr(),
          inputLabel: 'generate.text'.tr(),
          inputHint: 'generate.text_hint'.tr(),
          onClick: (data) {},
          controller: controller,
        ),
      );
}
