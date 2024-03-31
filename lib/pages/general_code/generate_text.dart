import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:master_scanner_app/common/widgets/result_appbar.dart';
import 'package:master_scanner_app/gen/assets.gen.dart';
import 'package:master_scanner_app/modes/qr_code_result_model.dart';
import 'package:master_scanner_app/pages/general_code/common/generate_single_input.dart';
import 'package:master_scanner_app/routes/routes.dart';

class GenerateText extends StatefulWidget {
  const GenerateText({super.key});

  @override
  State<GenerateText> createState() => _GenerateTextState();
}

class _GenerateTextState extends State<GenerateText> {
  _GenerateTextState();

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: ResultAppBar(
          title: 'generate.text'.tr(),
          action: Get.back,
          icon: Assets.icons.iconBack,
        ),
        body: GenerateSingleInputPage(
          iconPath: Assets.icons.iconText,
          appBarLabel: 'generate.text'.tr(),
          inputLabel: 'generate.text'.tr(),
          inputHint: 'generate.text_hint'.tr(),
          onClick: (data) {
            Get.toNamed(Routes.resultPage, arguments: QrCodeResultModel(data: data));
          },
          validate: (v) => null,
          controller: controller,
        ),
      );
}
