import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:master_scanner_app/core/app_color.dart';
import 'package:master_scanner_app/core/app_text_style.dart';

class ItemIconButton extends StatelessWidget {
  const ItemIconButton({super.key, required this.title, required this.icon, required this.onTap});

  final String title, icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: onTap(),
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(color: AppColor.primaryYellow, borderRadius: BorderRadius.circular(6)),
              alignment: Alignment.center,
              child: SvgPicture.asset(
                icon,
                colorFilter: const ColorFilter.mode(AppColor.grey, BlendMode.srcIn),
                width: 28,
                height: 28,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              title,
              style: AppTextStyle.footNote2.copyWith(fontSize: 15, color: AppColor.whiteLight),
            ),
          )
        ],
      );
}
