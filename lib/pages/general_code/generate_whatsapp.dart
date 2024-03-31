import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:master_scanner_app/common/widgets/result_appbar.dart';
import 'package:master_scanner_app/gen/assets.gen.dart';
import 'package:master_scanner_app/modes/qr_code_result_model.dart';
import 'package:master_scanner_app/pages/general_code/common/generate_single_input.dart';
import 'package:master_scanner_app/routes/routes.dart';

class GenerateWhatsApp extends StatefulWidget {
  const GenerateWhatsApp({super.key});

  @override
  State<GenerateWhatsApp> createState() => _GenerateWhatsAppState();
}

class _GenerateWhatsAppState extends State<GenerateWhatsApp> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Form(
          key: _formKey,
          child: GenerateSingleInputPage(
            iconPath: Assets.icons.iconPhone,
            appBarLabel: 'generate.whatsapp'.tr(),
            inputLabel: 'generate.whatsapp_label'.tr(),
            inputHint: 'generate.whatsapp_hint'.tr(),
            onClick: (data) {
              if (_formKey.currentState?.validate() ?? false) {
                Get.toNamed(Routes.resultPage, arguments: QrCodeResultModel(data: data));
              }
            },
            validate: (value) {
              if (value == null || value.trim() == '') {
                return 'error.required'.tr();
              }
              return null;
            },
            controller: controller,
          ),
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
