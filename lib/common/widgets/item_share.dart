import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_code_scanner/core/app_color.dart';
import 'package:qr_code_scanner/core/app_text_style.dart';

class ItemSupport extends StatelessWidget {
  const ItemSupport({
    super.key,
    required this.title,
    required this.description,
    required this.iconSrc,
    required this.onTap,
  });

  final String title, description, iconSrc;
  final Function onTap;

  @override
  Widget build(BuildContext context) => Container(
        constraints: const BoxConstraints(maxHeight: 68),
        decoration: const BoxDecoration(color: AppColor.grey),
        child: GestureDetector(
          onTap: onTap(),
          child: Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 12, left: 16, right: 20),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: SvgPicture.asset(iconSrc),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.title4.copyWith(fontWeight: FontWeight.w500, color: AppColor.whiteLight2),
                    ),
                    Text(
                      description,
                      style: AppTextStyle.footNote2.copyWith(color: AppColor.whiteLight3),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}

class GroupItemShare extends StatelessWidget {
  const GroupItemShare({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          constraints: const BoxConstraints(maxHeight: 204),
          child: Column(
            children: children,
          ),
        ),
      );
}
