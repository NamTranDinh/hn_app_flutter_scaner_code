import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:master_scanner_app/core/app_color.dart';
import 'package:master_scanner_app/core/app_text_style.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({super.key, required this.onChanged, required this.value});
  final ValueChanged<bool> onChanged;
  final bool value;

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: AppColor.grey,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(color: AppColor.pureBlack.withOpacity(0.5), blurRadius: 12),
          ],
        ),
        height: 60,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    widget.onChanged(true);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: widget.value ? AppColor.primaryYellow : AppColor.transparent,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      'history_page.scan'.tr(),
                      style: AppTextStyle.title4.copyWith(fontSize: 17, color: AppColor.white),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    widget.onChanged(false);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: !widget.value ? AppColor.primaryYellow : AppColor.transparent,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      'history_page.create'.tr(),
                      style: AppTextStyle.title4.copyWith(fontSize: 17, color: AppColor.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
