import 'package:base_core/base_core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:master_scanner_app/common/widgets/button_square.dart';
import 'package:master_scanner_app/common/widgets/no_grow_scroll_behavior.dart';
import 'package:master_scanner_app/common/widgets/qr_code_image.dart';
import 'package:master_scanner_app/common/widgets/result_appbar.dart';
import 'package:master_scanner_app/core/app_color.dart';
import 'package:master_scanner_app/core/app_text_style.dart';
import 'package:master_scanner_app/gen/assets.gen.dart';
import 'package:master_scanner_app/modes/qr_code_result_model.dart';

class QrCodePage extends StatelessWidget {
  const QrCodePage({super.key, required this.data});

  final QrCodeResultModel data;

  @override
  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: ResultAppBar(
          title: 'qr_code_page.title'.tr(),
          action: Get.back,
          icon: Assets.icons.iconBack,
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: -10,
              child: SvgPicture.asset(Assets.icons.iconBackground, fit: BoxFit.cover),
            ),
            Positioned(
              top: 34,
              left: 34,
              right: 34,
              bottom: 34,
              child: SafeArea(
                child: ScrollConfiguration(
                  behavior: NoGlowScrollBehavior(),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: context.widthDevice,
                          padding: const EdgeInsets.all(13),
                          decoration: BoxDecoration(
                            color: AppColor.lightGrey3.withOpacity(.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Data',
                                style: AppTextStyle.title3.copyWith(fontSize: 22, color: AppColor.whiteLight),
                              ),
                              const SizedBox(height: 8),
                              ExpandableText(
                                data.data ?? '',
                                maxLines: 10,
                                style: AppTextStyle.title3.copyWith(
                                  fontSize: 13,
                                  color: AppColor.lightGrey,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                expandText: 'button_action.show_more'.tr(),
                                collapseText: 'button_action.show_less'.tr(),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 55),
                        Flexible(
                          child: Container(
                            padding: const EdgeInsets.all(21),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: QrCodeImage(
                                data: data.data ?? '',
                                size: Size(context.widthDevice * .6, context.widthDevice * .6),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 55),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // TODO(nam): handle share btn
                            ButtonSquare(
                              onTap: () {},
                              svgIconPath: Assets.icons.share,
                              titleButton: 'button_action.share'.tr(),
                            ),
                            const SizedBox(width: 55),
                            // TODO(nam): handle save btn
                            ButtonSquare(
                              onTap: () {},
                              svgIconPath: Assets.icons.icFileDownload,
                              titleButton: 'button_action.save'.tr(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
