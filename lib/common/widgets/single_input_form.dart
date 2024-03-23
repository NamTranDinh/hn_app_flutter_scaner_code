import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_code_scanner/common/widgets/item_button.dart';
import 'package:qr_code_scanner/common/widgets/item_text_input.dart';
import 'package:qr_code_scanner/core/app_color.dart';

class SingerInputForm extends StatefulWidget {
  const SingerInputForm({
    super.key,
    required this.iconPath,
    required this.validate,
    required this.onClick,
    required this.label,
    required this.hint,
    required this.controller,
  });
  final String iconPath, label, hint;
  final String? Function(String?) validate;
  final Function(String) onClick;
  final TextEditingController controller;

  @override
  State<SingerInputForm> createState() => _SingerInputFormState();
}

class _SingerInputFormState extends State<SingerInputForm> {
  @override
  void initState() {
    super.initState();
  }

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
          boxShadow: [BoxShadow(color: AppColor.pureBlack.withAlpha(125), blurRadius: 12)],
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 37, bottom: 42, left: 24, right: 22),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                widget.iconPath,
                colorFilter: const ColorFilter.mode(AppColor.primaryYellow, BlendMode.srcIn),
                width: 60,
                height: 60,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18, bottom: 48),
                child: ItemTextInput(
                  label: widget.label,
                  controller: widget.controller,
                  hint: widget.hint,
                  validate: widget.validate,
                ),
              ),
              ItemButton(
                title: 'wifi_form.title'.tr(),
                onTap: () {
                  widget.onClick(widget.controller.text);
                },
              ),
            ],
          ),
        ),
      );
}
