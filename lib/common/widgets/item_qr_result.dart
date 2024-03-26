import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:master_scanner_app/core/app_color.dart';
import 'package:master_scanner_app/core/app_text_style.dart';
import 'package:master_scanner_app/gen/assets.gen.dart';

class ItemQrResult extends StatelessWidget {
  const ItemQrResult({
    super.key,
    required this.onDelete,
    required this.data,
    required this.type,
    required this.date,
    required this.onCopy,
  });

  final Function() onDelete, onCopy;
  final String data, type, date;

  @override
  Widget build(BuildContext context) => Container(
        height: 60,
        decoration: BoxDecoration(
          color: AppColor.grey,
          borderRadius: BorderRadius.circular(6),
          boxShadow: const [BoxShadow(color: AppColor.pureBlack, blurRadius: 8)],
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 6, bottom: 9, left: 17, right: 9),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15, top: 7, bottom: 5),
                child: SvgPicture.asset(
                  Assets.icons.iconScan,
                  width: 33,
                  height: 33,
                  colorFilter: const ColorFilter.mode(AppColor.primaryYellow, BlendMode.srcIn),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: onCopy(),
                          child: Text(
                            data,
                            style: AppTextStyle.body1.copyWith(fontWeight: FontWeight.w400, color: AppColor.whiteLight),
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: onDelete(),
                          child: SvgPicture.asset(
                            Assets.icons.iconDelete,
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            type,
                            style: AppTextStyle.caption2.copyWith(fontSize: 11, color: AppColor.lightGrey),
                          ),
                          const Spacer(),
                          Text(
                            date,
                            style: AppTextStyle.caption2.copyWith(fontSize: 11, color: AppColor.lightGrey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
