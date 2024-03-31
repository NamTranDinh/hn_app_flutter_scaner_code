import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:master_scanner_app/core/app_color.dart';
import 'package:master_scanner_app/core/app_text_style.dart';

class ButtonSquare extends StatelessWidget {
  const ButtonSquare({
    super.key,
    required this.onTap,
    required this.svgIconPath,
    this.titleButton,
    this.isLoading = false,
  });

  final Function() onTap;
  final String svgIconPath;
  final String? titleButton;
  final bool isLoading;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(60, 60),
              alignment: Alignment.center,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            ),
            onPressed: onTap,
            child: isLoading
                ? const CircularProgressIndicator(color: Colors.white)
                : SvgPicture.asset(
                    svgIconPath,
                    width: 32,
                    fit: BoxFit.contain,
                    colorFilter: const ColorFilter.mode(AppColor.grey, BlendMode.srcIn),
                  ),
          ),
          if (titleButton != null) ...[
            const SizedBox(height: 5),
            Text(
              titleButton ?? '',
              style: AppTextStyle.footNote2.copyWith(color: Colors.white, fontWeight: FontWeight.w500),
            ),
          ],
        ],
      );
}
