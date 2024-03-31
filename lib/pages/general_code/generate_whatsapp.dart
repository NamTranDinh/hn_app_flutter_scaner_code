import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:master_scanner_app/common/widgets/result_appbar.dart';
import 'package:master_scanner_app/gen/assets.gen.dart';
import 'package:master_scanner_app/pages/general_code/common/generate_single_input.dart';

class GenerateWhatsApp extends StatefulWidget {
  const GenerateWhatsApp({super.key});

  @override
  State<GenerateWhatsApp> createState() => _GenerateWhatsAppState();
}

class _GenerateWhatsAppState extends State<GenerateWhatsApp> {
  _GenerateWhatsAppState();

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: GenerateSingleInputPage(
          iconPath: Assets.icons.iconPhone,
          appBarLabel: 'generate.whatsapp'.tr(),
          inputLabel: 'generate.whatsapp_label'.tr(),
          inputHint: 'generate.whatsapp_hint'.tr(),
          onClick: (data) {
            Get.back();
          },
          controller: controller,
          validate: (String? v) => null,
        ),
        extendBodyBehindAppBar: true,
        appBar: ResultAppBar(
          title: 'generate.whatsapp'.tr(),
          action: () {
            Get.back();
          },
          icon: Assets.icons.iconBack,
        ),
      );
}
