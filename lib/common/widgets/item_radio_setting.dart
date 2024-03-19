import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_code_scanner/core/app_color.dart';
import 'package:qr_code_scanner/core/app_text_style.dart';

class ItemRadioSetting extends StatefulWidget {
  const ItemRadioSetting({
    super.key,
    required this.onchange,
    required this.title,
    required this.description,
    required this.iconSrc,
  });

  final Function(bool) onchange;
  final String title, description, iconSrc;

  @override
  State<ItemRadioSetting> createState() => _ItemRadioSettingState();
}

class _ItemRadioSettingState extends State<ItemRadioSetting> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) => Container(
        height: 68,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColor.grey),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: SvgPicture.asset(
                  widget.iconSrc,
                  width: 24,
                  height: 24,
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: AppTextStyle.title4.copyWith(fontWeight: FontWeight.w600, color: AppColor.whiteLight),
                    ),
                    Text(
                      widget.description,
                      style: AppTextStyle.footNote2.copyWith(color: AppColor.whiteLight),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 40,
                height: 40,
                child: Switch.adaptive(
                  value: isOn,
                  onChanged: (v) {
                    setState(() {
                      isOn = !isOn;
                    });
                    widget.onchange(isOn);
                  },
                ),
              ),
              // Radio.adaptive(value: true, groupValue: , onChanged: onChanged)
            ],
          ),
        ),
      );
}
