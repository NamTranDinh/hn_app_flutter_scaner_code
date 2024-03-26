import 'package:easy_localization/easy_localization.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:master_scanner_app/core/app_color.dart';
import 'package:master_scanner_app/core/app_text_style.dart';
import 'package:master_scanner_app/gen/assets.gen.dart';
import 'package:master_scanner_app/routes/routes.dart';

class ItemResultDetail extends StatelessWidget {
  const ItemResultDetail({super.key, required this.type, required this.date, required this.data});

  final String type, date, data;

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(
          color: AppColor.lightGrey3,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [BoxShadow(color: AppColor.pureBlack.withAlpha((255 * 0.25).toInt()), blurRadius: 8)],
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 19, bottom: 12, left: 24, right: 22),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 7, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      Assets.icons.iconScan,
                      width: 49,
                      height: 49,
                      colorFilter: const ColorFilter.mode(AppColor.primaryYellow, BlendMode.srcIn),
                    ),
                    const SizedBox(width: 13),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            type,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyle.title3.copyWith(fontSize: 22, color: AppColor.whiteLight),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            date,
                            style: AppTextStyle.title3.copyWith(fontSize: 13, color: AppColor.lightGrey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(color: AppColor.whiteLight),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 13),
                child: ExpandableText(
                  data,
                  maxLines: 10,
                  style: AppTextStyle.title3.copyWith(
                    fontSize: 17,
                    color: AppColor.whiteLight,
                    overflow: TextOverflow.ellipsis,
                  ),
                  expandText: 'button_action.show_more'.tr(),
                  collapseText: 'button_action.show_less'.tr(),
                ),
              ),
              TextButton(
                onPressed: () => Get.toNamed(Routes.qrCodePage),
                child: Text(
                  'button_action.show_qr_code'.tr(),
                  style: AppTextStyle.title3.copyWith(fontSize: 15, color: AppColor.primaryYellow),
                ),
              ),
            ],
          ),
        ),
      );
}
