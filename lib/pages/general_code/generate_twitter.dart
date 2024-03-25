import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:master_scanner_app/common/widgets/result_appbar.dart';
import 'package:master_scanner_app/gen/assets.gen.dart';
import 'package:master_scanner_app/pages/general_code/common/generate_single_input.dart';

class GenerateTwitter extends StatefulWidget {
  const GenerateTwitter({super.key});

  @override
  State<GenerateTwitter> createState() => _GenerateTwitterState();
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
