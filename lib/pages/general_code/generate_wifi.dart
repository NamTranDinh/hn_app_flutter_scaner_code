import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:qr_code_scanner/common/widgets/result_appbar.dart';
import 'package:qr_code_scanner/gen/assets.gen.dart';
import 'package:qr_code_scanner/pages/general_code/common/generate_wifi_page.dart';

class GenerateWifi extends StatelessWidget {
  const GenerateWifi({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: GenerateWifiInputPage(
          iconPath: Assets.icons.iconWifi,
          appBarLabel: 'generate.wifi'.tr(),
          onClick: (name, password) {},
        ),
        appBar: ResultAppBar(
          title: 'generate.wifi'.tr(),
          action: () {
            Get.back();
          },
          icon: Assets.icons.iconBack,
        ),
      );
}
