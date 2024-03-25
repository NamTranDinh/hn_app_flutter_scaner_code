import 'package:flutter/material.dart';
import 'package:master_scanner_app/core/app_color.dart';
import 'package:master_scanner_app/core/app_text_style.dart';

class ItemButton extends StatelessWidget {
  const ItemButton({
    super.key,
    required this.title,
    required this.onTap,
    this.borderRadius,
    this.shape,
    this.textColor,
    this.textSize,
  });

  final String title;
  final Function() onTap;
  final double? borderRadius;
  final OutlinedBorder? shape;
  final Color? textColor;
  final double? textSize;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 46,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.primaryYellow,
            elevation: 1,
            shape: shape ?? RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: Text(
            title,
            style: AppTextStyle.body2.copyWith(color: AppColor.grey).copyWith(color: textColor, fontSize: textSize),
          ),
        ),
      );
}
