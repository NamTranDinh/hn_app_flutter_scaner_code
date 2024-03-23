import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_code_scanner/core/app_color.dart';

class ItemQr extends StatelessWidget {
  const ItemQr({super.key, required this.iconSrc, required this.textValue, required this.onTap});

  final double width = 86;
  final double height = 92;
  final String iconSrc;
  final String textValue;
  final Function() onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: SizedBox(
          width: width,
          height: height,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned(
                top: 10,
                width: 86,
                height: 82,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColor.grey,
                    boxShadow: [
                      BoxShadow(color: AppColor.pureBlack.withAlpha(153), blurRadius: 12),
                    ],
                  ),
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: SvgPicture.asset(
                      iconSrc,
                      width: 40,
                      height: 40,
                      fit: BoxFit.scaleDown,
                      colorFilter: const ColorFilter.mode(AppColor.grey, BlendMode.color),
                    ),
                  ),
                ),
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Container(
                  height: 22,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: AppColor.whiteLight, borderRadius: BorderRadius.circular(4)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: Text(
                      textValue,
                      style: const TextStyle(color: AppColor.naviBlue, fontSize: 12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
