import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:master_scanner_app/common/widgets/single_input_form.dart';
import 'package:master_scanner_app/core/app_color.dart';
import 'package:master_scanner_app/gen/assets.gen.dart';

class GenerateSingleInputPage extends StatelessWidget {
  const GenerateSingleInputPage({
    super.key,
    required this.appBarLabel,
    required this.inputLabel,
    required this.inputHint,
    required this.onClick,
    required this.iconPath,
    required this.controller,
    required this.validate,
  });

  final String appBarLabel, inputLabel, inputHint, iconPath;
  final Function(String data) onClick;
  final TextEditingController controller;
  final String? Function(String?) validate;

  void back() {
    Get.back();
  }

  Widget body(Size size) => Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            width: size.width,
            height: size.height,
            child: Container(
              color: AppColor.grey,
              child: SvgPicture.asset(Assets.icons.iconBackground, fit: BoxFit.cover),
            ),
          ),
          Positioned(
            width: 335,
            height: 336,
            child: SingerInputForm(
              iconPath: iconPath,
              label: inputLabel,
              validate: validate,
              hint: inputHint,
              controller: controller,
              onClick: onClick,
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return body(size);
  }
}
