import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:master_scanner_app/common/utils/validator.dart';
import 'package:master_scanner_app/common/widgets/result_appbar.dart';
import 'package:master_scanner_app/gen/assets.gen.dart';
import 'package:master_scanner_app/pages/general_code/common/generate_single_input.dart';

class GeneratePhone extends StatefulWidget {
  const GeneratePhone({super.key});

  @override
  State<GeneratePhone> createState() => _GeneratePhoneState();
}

class _GeneratePhoneState extends State<GeneratePhone> {
  _GeneratePhoneState();

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: true,
        body: GenerateSingleInputPage(
          iconPath: Assets.icons.iconPhoneNumber,
          appBarLabel: 'generate.phone'.tr(),
          inputLabel: 'generate.phone_label'.tr(),
          inputHint: 'generate.phone_hint'.tr(),
          onClick: (data) {
            Get.back();
          },
          validate: (v) => Validator.isPhoneNumber(v) ? null : 'phone number invalid',
          controller: controller,
        ),
        appBar: ResultAppBar(
            title: 'generate.phone'.tr(),
            action: () {
              Get.back();
            },
            icon: Assets.icons.iconBack),
      );
}
