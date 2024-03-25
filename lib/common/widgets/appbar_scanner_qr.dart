import 'package:base_core/base_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:master_scanner_app/core/app_color.dart';
import 'package:master_scanner_app/gen/assets.gen.dart';

class AppbarScannerQr extends StatelessWidget implements PreferredSizeWidget {
  const AppbarScannerQr({
    super.key,
    required this.onTapImage,
    required this.onTapFlash,
    required this.onChangeCamera,
    required this.isFlashOff,
    this.isShowShadow = true,
  });

  final Function() onTapImage, onTapFlash, onChangeCamera;
  final bool isFlashOff, isShowShadow;

  @override
  Widget build(BuildContext context) => Container(
        width: context.widthDevice * .8,
        decoration: BoxDecoration(
          color: AppColor.grey,
          borderRadius: BorderRadius.circular(10),
          boxShadow: isShowShadow ? [BoxShadow(color: AppColor.grey.withAlpha(79 * 255 ~/ 100), blurRadius: 20)] : null,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 26),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: onTapImage,
                child: SvgPicture.asset(
                  Assets.icons.img,
                  width: 25,
                  height: 25,
                ),
              ),
              GestureDetector(
                onTap: onTapFlash,
                child: SvgPicture.asset(
                  isFlashOff ? Assets.icons.flash : Assets.icons.flashSlash,
                  width: 25,
                  height: 25,
                ),
              ),
              GestureDetector(
                onTap: onChangeCamera,
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

  @override
  Size get preferredSize => const Size.fromHeight(45);
}
