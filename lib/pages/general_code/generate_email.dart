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

class GenerateEmail extends StatefulWidget {
  const GenerateEmail({super.key});

  @override
  State<GenerateEmail> createState() => _GenerateEmailState();
}

class _GenerateEmailState extends State<GenerateEmail> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: ResultAppBar(
          title: 'generate.email'.tr(),
          action: Get.back,
          icon: Assets.icons.iconBack,
        ),
        body: Form(
          key: _formKey,
          child: GenerateSingleInputPage(
            controller: controller,
            iconPath: Assets.icons.iconEmail,
            appBarLabel: 'generate.email'.tr(),
            inputLabel: 'generate.email'.tr(),
            inputHint: 'generate.email_hint'.tr(),
            onClick: (data) {
              if (_formKey.currentState?.validate() ?? false) {
                Get.toNamed(Routes.resultPage, arguments: QrCodeResultModel(data: data));
              }
            },
            validate: (value) {
              if (value == null || value.trim() == '') {
                return Validator.isEmail(value) ? null : 'email is not valid';
              }
              return null;
            },
          ),
        ),
      );
}
