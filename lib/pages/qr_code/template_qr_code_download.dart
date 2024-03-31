import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:master_scanner_app/core/app_color.dart';
import 'package:master_scanner_app/core/app_text_style.dart';
import 'package:master_scanner_app/gen/assets.gen.dart';
import 'package:package_info_plus/package_info_plus.dart';

class TemplateQrCodeDownload extends StatelessWidget {
  const TemplateQrCodeDownload({super.key, required this.qrCodeWidget, required this.size});

  final Widget qrCodeWidget;
  final Size size;

  @override
  Widget build(BuildContext context) => body(context);

  Widget body(BuildContext context) => Material(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: size.height,
              width: size.width,
              color: AppColor.grey,
              child: SvgPicture.asset(Assets.icons.iconBackground, fit: BoxFit.cover),
            ),
            Positioned(
              top: size.height * .3,
              child: qrCodeWidget,
            ),
            Positioned(
              bottom: 13,
              right: 13,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Assets.images.appIcon.path,
                    width: 13,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 5),
                  FutureBuilder(
                    future: PackageInfo.fromPlatform(),
                    builder: (context, snapshot) => Text(
                      snapshot.data?.appName ?? 'Master QR',
                      style: AppTextStyle.body1.copyWith(color: Colors.white, fontSize: 8),
                    ),
                  ),
                ],
              ),
            ),
            // Align(
            //   alignment: Alignment.bottomCenter,
            //   child: Container(
            //     height: 150,
            //     margin: const EdgeInsets.all(21),
            //     child: Column(
            //       mainAxisSize: MainAxisSize.min,
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Flexible(
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               Image.asset(
            //                 Assets.images.appIcon.path,
            //                 width: 55,
            //                 fit: BoxFit.contain,
            //               ),
            //               const SizedBox(width: 13),
            //               FutureBuilder(
            //                 future: PackageInfo.fromPlatform(),
            //                 builder: (context, snapshot) => Text(
            //                   snapshot.data?.appName ?? 'Master QR',
            //                   style: AppTextStyle.body1.copyWith(color: Colors.white),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //         const SizedBox(height: 21),
            //         Expanded(
            //           child: Row(
            //             children: [
            //               Expanded(child: SvgPicture.asset(Assets.images.chplay)),
            //               const SizedBox(width: 21),
            //               Expanded(child: SvgPicture.asset(Assets.images.appstore)),
            //             ],
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      );
}
