import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:master_scanner_app/common/widgets/item_button.dart';
import 'package:master_scanner_app/common/widgets/item_text_input.dart';
import 'package:master_scanner_app/core/app_color.dart';

class WifiInputForm extends StatelessWidget {
  const WifiInputForm({
    super.key,
    required this.iconPath,
    required this.validate,
    required this.onClick,
    required this.nameController,
    required this.passwordController,
  });
  final String iconPath;
  final String? Function(String?) validate;
  final Function(String email, String password) onClick;
  final TextEditingController nameController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(
          color: AppColor.grey,
          borderRadius: BorderRadius.circular(6),
          border: const Border(
            top: BorderSide(
              color: AppColor.primaryYellow,
              width: 2.0,
            ),
            bottom: BorderSide(
              color: AppColor.primaryYellow,
              width: 2.0,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 37, bottom: 42, left: 24, right: 22),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                iconPath,
                colorFilter: const ColorFilter.mode(AppColor.primaryYellow, BlendMode.srcIn),
                width: 60,
                height: 60,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18, bottom: 6),
                child: ItemTextInput(
                  label: 'wifi_form.title_name'.tr(),
                  controller: nameController,
                  hint: 'wifi_form.hint_name'.tr(),
                  validate: validate,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 48),
                child: ItemTextInput(
                  label: 'wifi_form.title_password'.tr(),
                  controller: passwordController,
                  hint: 'wifi_form.hint_password'.tr(),
                  validate: validate,
                ),
              ),
              ItemButton(
                title: 'wifi_form.title'.tr(),
                onTap: () {
                  onClick(nameController.text, passwordController.text);
                },
              ),
            ],
          ),
        ),
      );
}
