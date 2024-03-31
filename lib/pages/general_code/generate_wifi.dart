import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:master_scanner_app/common/widgets/result_appbar.dart';
import 'package:master_scanner_app/gen/assets.gen.dart';
import 'package:master_scanner_app/modes/qr_code_result_model.dart';
import 'package:master_scanner_app/pages/general_code/common/generate_wifi_page.dart';
import 'package:master_scanner_app/routes/routes.dart';

class GenerateWifi extends StatefulWidget {
  const GenerateWifi({super.key});

  @override
  State<GenerateWifi> createState() => _GenerateWifiState();
}

class _GenerateWifiState extends State<GenerateWifi> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Form(
          key: _formKey,
          child: GenerateWifiInputPage(
            iconPath: Assets.icons.iconWifi,
            appBarLabel: 'generate.wifi'.tr(),
            onClick: (name, password) {
              if (_formKey.currentState?.validate() ?? false) {
                Get.toNamed(Routes.resultPage, arguments: QrCodeResultModel(data: name));
              }
            },
            validate: (value) {
              if (value == null || value.trim() == '') {
                return 'error.required'.tr();
              }
              return null;
            },
          ),
        ),
        appBar: ResultAppBar(
          title: 'generate.wifi'.tr(),
          action: () {
            Get.back();
          },
          icon: Assets.icons.iconBack,
        ),
        extendBodyBehindAppBar: true,
      );
}
