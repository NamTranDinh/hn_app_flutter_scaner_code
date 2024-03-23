import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:qr_code_scanner/common/widgets/result_appbar.dart';
import 'package:qr_code_scanner/gen/assets.gen.dart';
import 'package:qr_code_scanner/pages/general_code/common/generate_single_input.dart';

class GenerateWhatsApp extends StatefulWidget {
  const GenerateWhatsApp({super.key});

  @override
  _GenerateWhatsAppState createState() => _GenerateWhatsAppState();
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
        ),
        appBar: ResultAppBar(
          title: 'generate.whatsapp'.tr(),
          action: () {
            Get.back();
          },
          icon: Assets.icons.iconBack,
        ),
      );
}
