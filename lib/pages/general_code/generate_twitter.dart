import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:qr_code_scanner/common/widgets/result_appbar.dart';
import 'package:qr_code_scanner/gen/assets.gen.dart';
import 'package:qr_code_scanner/pages/general_code/common/generate_single_input.dart';

class GenerateTwitter extends StatefulWidget {
  const GenerateTwitter({super.key});

  @override
  _GenerateTwitterState createState() => _GenerateTwitterState();
}

class _GenerateTwitterState extends State<GenerateTwitter> {
  _GenerateTwitterState();

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: GenerateSingleInputPage(
          iconPath: Assets.icons.iconText,
          appBarLabel: 'generate.twitter'.tr(),
          inputLabel: 'generate.twitter_label'.tr(),
          inputHint: 'generate.twitter_hint'.tr(),
          onClick: (data) {
            Get.back();
          },
          controller: controller,
        ),
        appBar: ResultAppBar(
          title: 'generate.twitter'.tr(),
          action: () {
            Get.back();
          },
          icon: Assets.icons.iconText,
        ),
      );
}
