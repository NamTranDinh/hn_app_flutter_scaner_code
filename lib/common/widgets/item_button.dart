import 'package:flutter/material.dart';
import 'package:qr_code_scanner/core/app_color.dart';
import 'package:qr_code_scanner/core/app_text_style.dart';

class ItemButton extends StatelessWidget {
  const ItemButton({super.key, required this.title, required this.onTap});

  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap(),
        child: Container(
          alignment: Alignment.center,
          height: 46,
          decoration: BoxDecoration(
            color: AppColor.primaryYellow,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [BoxShadow(color: AppColor.primaryBlack.withAlpha((255 * 0.3).toInt()), blurRadius: 21)],
          ),
          child: Text(
            title,
            style: AppTextStyle.body2.copyWith(
              color: AppColor.grey,
            ),
          ),
        ),
      );
}
