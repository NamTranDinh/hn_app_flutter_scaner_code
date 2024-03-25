import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:master_scanner_app/core/app_color.dart';
import 'package:master_scanner_app/core/app_text_style.dart';

class NavItem extends StatelessWidget {
  const NavItem({
    super.key,
    required this.onTap,
    required this.svgIconPath,
    this.isSelected = false,
    required this.title,
  });

  final void Function() onTap;
  final String title;
  final String svgIconPath;
  final bool isSelected;

  @override
  Widget build(BuildContext context) => Expanded(
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                svgIconPath,
                colorFilter: ColorFilter.mode(
                  isSelected ? AppColor.primaryYellow : AppColor.white,
                  BlendMode.srcIn,
                ),
              ),
              Text(
                title,
                style: AppTextStyle.title4.copyWith(
                  color: isSelected ? AppColor.primaryYellow : AppColor.white,
                ),
              ),
            ],
          ),
        ),
      );
}
