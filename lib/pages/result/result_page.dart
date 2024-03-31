import 'package:base_core/base_core.dart' as base_core;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:master_scanner_app/common/utils/toast_utils.dart';
import 'package:master_scanner_app/common/widgets/button_square.dart';
import 'package:master_scanner_app/common/widgets/item_result_detail.dart';
import 'package:master_scanner_app/common/widgets/result_appbar.dart';
import 'package:master_scanner_app/gen/assets.gen.dart';
import 'package:master_scanner_app/modes/qr_code_result_model.dart';
import 'package:master_scanner_app/routes/routes.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key, required this.data});

  final QrCodeResultModel data;

  @override
  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: ResultAppBar(
          title: 'result_page.title'.tr(),
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
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Scrollbar(
                        child: SingleChildScrollView(
                          child: InkWell(
                            onTap: () {},
                            child: ItemResultDetail(
                              type: 'Data',
                              data: data.data ?? '',
                              date: base_core.DateUtils.formatDateTimeToString(
                                dateTime: base_core.DateUtils.formatStringToDateTime(dateString: data.createDate),
                                formatter: 'd MMM y, h:mm a',
                              ),
                              onTapShowQrCode: () => Get.toNamed(Routes.qrCodePage, arguments: data),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 55),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ButtonSquare(
                          svgIconPath: Assets.icons.share,
                          onTap: () {
                            if (data.data?.isNotEmpty ?? false) {
                              Share.share(data.data ?? '');
                            } else {
                              showToast(mess: 'error.no_data_to_share'.tr());
                            }
                          },
                          titleButton: 'button_action.share'.tr(),
                        ),
                        const SizedBox(width: 55),
                        ButtonSquare(
                          onTap: () {
                            Clipboard.setData(ClipboardData(text: data.data ?? '')).then((value) {
                              showToast(mess: 'button_action.copied'.tr());
                            });
                          },
                          svgIconPath: Assets.icons.icSave,
                          titleButton: 'button_action.copy'.tr(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
