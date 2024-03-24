import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_code_scanner/core/app_color.dart';
import 'package:qr_code_scanner/gen/assets.gen.dart';

class ItemScanInput extends StatelessWidget {
  const ItemScanInput({super.key, required this.choseImage, required this.flash, required this.changeCamera});

  final Function choseImage, flash, changeCamera;

  @override
  Widget build(BuildContext context) => Container(
        constraints: const BoxConstraints(maxHeight: 45, maxWidth: 336),
        decoration: BoxDecoration(
          color: AppColor.grey,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(color: AppColor.pureBlack.withAlpha(79 * 255 ~/ 100), blurRadius: 20)],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 26),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: choseImage(),
                child: SvgPicture.asset(
                  Assets.icons.img,
                  width: 25,
                  height: 25,
                ),
              ),
              GestureDetector(
                onTap: flash(),
                child: SvgPicture.asset(
                  Assets.icons.flash,
                  width: 25,
                  height: 25,
                ),
              ),
              GestureDetector(
                onTap: changeCamera(),
                child: SvgPicture.asset(
                  Assets.icons.iconChangeCam,
                  width: 25,
                  height: 25,
                  colorFilter: const ColorFilter.mode(AppColor.whiteLight, BlendMode.srcIn),
                ),
              ),
            ],
          ),
        ),
      );
}
