import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:master_scanner_app/core/app_color.dart';

class ItemQr extends StatelessWidget {
  const ItemQr({super.key, required this.iconSrc, required this.textValue, required this.onTap});

  final String iconSrc;
  final String textValue;
  final Function() onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Stack(
          fit: StackFit.passthrough,
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColor.grey,
                boxShadow: [
                  BoxShadow(color: AppColor.pureBlack.withAlpha(144), blurRadius: 12),
                ],
              ),
              child: Center(
                child: SvgPicture.asset(
                  iconSrc,
                  width: 34,
                  fit: BoxFit.contain,
                  colorFilter: const ColorFilter.mode(AppColor.grey, BlendMode.color),
                ),
              ),
            ),
            Positioned(
              bottom: -(21 / 2),
              child: Container(
                height: 21,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                alignment: Alignment.center,
                decoration: BoxDecoration(color: AppColor.whiteLight, borderRadius: BorderRadius.circular(4)),
                child: Text(
                  textValue,
                  style: const TextStyle(color: AppColor.naviBlue, fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      );
}
