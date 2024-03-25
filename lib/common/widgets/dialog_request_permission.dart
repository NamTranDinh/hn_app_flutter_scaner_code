import 'package:base_core/base_core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:master_scanner_app/common/widgets/item_button.dart';
import 'package:master_scanner_app/core/app_text_style.dart';
import 'package:master_scanner_app/gen/assets.gen.dart';
import 'package:permission_handler/permission_handler.dart';

Future<dynamic> openDialogRequestPermission(
  BuildContext context, {
  void Function()? onCancel,
  String? title,
  String? subTitle,
  String? tranPermissionDesc,
  String? tranPermissionTitle,
  bool? dismissible,
}) =>
    showDialog(
      context: context,
      barrierDismissible: dismissible ?? true,
      builder: (context) => AlertDialog(
        scrollable: true,
        backgroundColor: Colors.white,
        contentPadding: EdgeInsets.zero,
        iconPadding: EdgeInsets.zero,
        content: _PermissionRequestContent(
          title: context.tr('dialog.request_permission.camera'),
          subTitle: context.tr('dialog.request_permission.content'),
          svgPath: Assets.images.undrawMobileEncryption,
          openSetting: () {
            Get.back();
            openAppSettings();
          },
          onCancel: Get.back,
        ),
      ),
    );

class _PermissionRequestContent extends StatelessWidget {
  const _PermissionRequestContent({
    required this.title,
    required this.subTitle,
    required this.svgPath,
    required this.openSetting,
    required this.onCancel,
  });

  final String title;
  final String subTitle;
  final String svgPath;
  final Function() openSetting;
  final Function() onCancel;

  @override
  Widget build(BuildContext context) => Container(
        height: context.heightDevice * .7,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SvgPicture.asset(
                  Assets.images.undrawMobileEncryption,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title, style: AppTextStyle.body1),
                  const SizedBox(height: 5),
                  Text(subTitle, style: AppTextStyle.footNote2, textAlign: TextAlign.center),
                  const SizedBox(height: 55),
                  ItemButton(
                    title: context.tr('dialog.request_permission.open_setting'),
                    onTap: openSetting,
                    textColor: Colors.white,
                    shape: const StadiumBorder(),
                  ),
                  const SizedBox(height: 8),
                  TextButton(onPressed: onCancel, child: Text(context.tr('dialog.request_permission.not_now'))),
                ],
              ),
            ),
          ],
        ),
      );
}
