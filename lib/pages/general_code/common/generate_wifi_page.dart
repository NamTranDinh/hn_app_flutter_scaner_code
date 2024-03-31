import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:master_scanner_app/common/widgets/wifi_form_input.dart';
import 'package:master_scanner_app/core/app_color.dart';
import 'package:master_scanner_app/gen/assets.gen.dart';

class GenerateWifiInputPage extends StatelessWidget {
  const GenerateWifiInputPage({
    super.key,
    required this.appBarLabel,
    required this.onClick,
    required this.iconPath,
    this.validate,
  });

  final String appBarLabel, iconPath;
  final Function(String name, String password) onClick;
  final String? Function(String? value)? validate;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 0,
          width: size.width,
          height: size.height,
          child: Container(
            color: AppColor.grey,
            child: SvgPicture.asset(Assets.icons.iconBackground, fit: BoxFit.fill),
          ),
        ),
        Positioned(
          width: 335,
          child: WifiInputForm(
            iconPath: iconPath,
            validate: (value) => validate != null ? validate!(value) : null,
            nameController: TextEditingController(),
            passwordController: TextEditingController(),
            onClick: onClick,
          ),
        ),
      ],
    );
  }
}
