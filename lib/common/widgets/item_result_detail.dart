import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:master_scanner_app/core/app_color.dart';
import 'package:master_scanner_app/core/app_text_style.dart';
import 'package:master_scanner_app/gen/assets.gen.dart';

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
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15, top: 7, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      Assets.icons.iconScan,
                      width: 49,
                      height: 49,
                      colorFilter: const ColorFilter.mode(AppColor.primaryYellow, BlendMode.srcIn),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 17),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            type,
                            style: AppTextStyle.title3.copyWith(fontSize: 22, color: AppColor.whiteLight),
                          ),
                          Text(
                            date,
                            style: AppTextStyle.title3.copyWith(fontSize: 13, color: AppColor.lightGrey),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              const Divider(
                color: AppColor.whiteLight,
              ),
              Text(
                data,
                style: AppTextStyle.title3.copyWith(fontSize: 17, color: AppColor.whiteLight),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 13.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Show QR Code',
                    style: AppTextStyle.title3.copyWith(fontSize: 15, color: AppColor.primaryYellow),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
