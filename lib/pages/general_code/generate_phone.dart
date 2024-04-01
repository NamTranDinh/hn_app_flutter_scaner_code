import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:master_scanner_app/common/utils/validator.dart';
import 'package:master_scanner_app/common/widgets/result_appbar.dart';
import 'package:master_scanner_app/gen/assets.gen.dart';
import 'package:master_scanner_app/modes/qr_code_result_model.dart';
import 'package:master_scanner_app/pages/general_code/common/generate_single_input.dart';
import 'package:master_scanner_app/routes/routes.dart';

class GeneratePhone extends StatefulWidget {
  const GeneratePhone({super.key});

  @override
  State<GeneratePhone> createState() => _GeneratePhoneState();
}

class _GeneratePhoneState extends State<GeneratePhone> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: true,
        body: Form(
          key: _formKey,
          child: GenerateSingleInputPage(
            iconPath: Assets.icons.iconPhoneNumber,
            appBarLabel: 'generate.phone'.tr(),
            inputLabel: 'generate.phone_label'.tr(),
            inputHint: 'generate.phone_hint'.tr(),
            onClick: (data) {
              if (_formKey.currentState?.validate() ?? false) {
                Get.toNamed(Routes.resultPage, arguments: QrCodeResultModel(data: data));
              }
            },
            validate: (value) {
              if (value == null || value.trim() == '') {
                return Validator.isPhoneNumber(value) ? null : 'phone number is not valid';
              }
              return null;
            },
            controller: controller,
          ),
        ),
        appBar: ResultAppBar(
          title: 'generate.phone'.tr(),
          action: () {
            Get.back();
          },
          icon: Assets.icons.iconBack,
        ),
      );
}
