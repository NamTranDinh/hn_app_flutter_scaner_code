import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:master_scanner_app/common/utils/toast_utils.dart';
import 'package:master_scanner_app/common/widgets/appbar.dart';
import 'package:master_scanner_app/common/widgets/item_qr.dart';
import 'package:master_scanner_app/gen/assets.gen.dart';
import 'package:master_scanner_app/routes/routes.dart';

class GeneratePage extends StatelessWidget {
  const GeneratePage({super.key});

  @override
  Widget build(BuildContext context) => _rootView(context);

  Widget _rootView(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomAppBar(title: 'generate.appbar_title'.tr(), action: () {}),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 13, right: 13),
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 13,
                  crossAxisSpacing: 13,
                ),
                children: [
                  ItemQr(
                    iconSrc: Assets.icons.iconText,
                    textValue: 'generate.text'.tr(),
                    onTap: () => Get.toNamed(Routes.generateQrText),
                  ),
                  ItemQr(
                    iconSrc: Assets.icons.iconEmail,
                    textValue: 'generate.email'.tr(),
                    onTap: () => Get.toNamed(Routes.generateQrEmail),
                  ),
                  ItemQr(
                    iconSrc: Assets.icons.iconWifi,
                    textValue: 'generate.wifi'.tr(),
                    onTap: () => Get.toNamed(Routes.generateQrWifi),
                  ),
                  ItemQr(
                    iconSrc: Assets.icons.iconInsta,
                    textValue: 'generate.instagram'.tr(),
                    onTap: () => Get.toNamed(Routes.generateQrInstagram),
                  ),
                  ItemQr(
                    iconSrc: Assets.icons.iconPhone,
                    textValue: 'generate.whatsapp'.tr(),
                    onTap: () => Get.toNamed(Routes.generateQrWhatsApp),
                  ),
                  ItemQr(
                    iconSrc: Assets.icons.iconEvent,
                    textValue: 'generate.event'.tr(),
                    onTap: () => Get.toNamed(Routes.generateQrEvent),
                  ),
                  ItemQr(
                    iconSrc: Assets.icons.iconContact,
                    textValue: 'generate.contact'.tr(),
                    onTap: () => Get.toNamed(Routes.generateQrContact),
                  ),
                  ItemQr(
                    iconSrc: Assets.icons.itemBusiness,
                    textValue: 'generate.business'.tr(),
                    onTap: () => Get.toNamed(Routes.generateQrBusiness),
                  ),
                  ItemQr(
                    iconSrc: Assets.icons.itemLocation,
                    textValue: 'generate.location'.tr(),
                    onTap: () {
                      showToast(mess: 'This feature is developing!');
                      // Get.toNamed(Routes.generateQrLocation);
                    },
                  ),
                  ItemQr(
                    iconSrc: Assets.icons.iconPhoneNumber,
                    textValue: 'generate.phone'.tr(),
                    onTap: () => Get.toNamed(Routes.generateQrPhone),
                  ),
                  ItemQr(
                    iconSrc: Assets.icons.iconBird,
                    textValue: 'generate.twitter'.tr(),
                    onTap: () => Get.toNamed(Routes.generateQrTwitter),
                  ),
                  ItemQr(
                    iconSrc: Assets.icons.iconWeb,
                    textValue: 'generate.website'.tr(),
                    onTap: () => Get.toNamed(Routes.generateQrWeb),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
}
