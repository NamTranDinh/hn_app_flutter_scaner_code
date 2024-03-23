import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:qr_code_scanner/common/widgets/result_appbar.dart';
import 'package:qr_code_scanner/gen/assets.gen.dart';
import 'package:qr_code_scanner/pages/general_code/common/generate_single_input.dart';

class GenerateEmail extends StatefulWidget {
  const GenerateEmail({super.key});

  @override
  _GenerateEmailState createState() => _GenerateEmailState();
}

class _GenerateEmailState extends State<GenerateEmail> {
  _GenerateEmailState();

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: GenerateSingleInputPage(
          iconPath: Assets.icons.iconEmail,
          appBarLabel: 'generate.email'.tr(),
          inputLabel: 'generate.email'.tr(),
          inputHint: 'generate.email_hint'.tr(),
          onClick: (data) {
            Get.back();
          },
          controller: controller,
        ),
        appBar: ResultAppBar(
          title: 'generate.email'.tr(),
          action: () {
            Get.back();
          },
          icon: Assets.icons.iconBack,
        ),
      );
}
