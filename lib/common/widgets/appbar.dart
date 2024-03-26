import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:master_scanner_app/core/app_color.dart';
import 'package:master_scanner_app/core/app_text_style.dart';
import 'package:master_scanner_app/gen/assets.gen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title, required this.action});

  final String title;

  final Function() action;

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Container(
          height: kToolbarHeight,
          color: AppColor.grey,
          alignment: Alignment.center,
          child: Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: AppTextStyle.title1.copyWith(
                      color: AppColor.blackD9,
                      fontSize: 27,
                      fontWeight: FontWeight.w400,
                      overflow: TextOverflow.ellipsis),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 31.0),
                  child: GestureDetector(
                    onTap: action,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(color: AppColor.pureBlack.withAlpha((255 * 0.6).toInt()), blurRadius: 20),
                        ],
                        color: AppColor.grey,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SvgPicture.asset(
                          Assets.icons.menu,
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
