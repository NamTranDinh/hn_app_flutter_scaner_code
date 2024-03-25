import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:master_scanner_app/core/app_extension.dart';
import 'package:master_scanner_app/core/app_text_style.dart';
import 'package:master_scanner_app/gen/assets.gen.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          width: context.screenWidth,
          height: context.screenHeight,
          padding: const EdgeInsets.symmetric(vertical: 56, horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'page_not_found.oops'.tr(),
                          style: AppTextStyle.heading1.copyWith(fontWeight: FontWeight.bold, fontSize: 36),
                        ),
                        Text(
                          'page_not_found.description'.tr(),
                          style: AppTextStyle.title5.copyWith(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(height: 56),
                    Lottie.asset(
                      Assets.anim.animDinosaurPageNotFound,
                      height: context.screenWidth * .8,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 36),
            ],
          ),
        ),
      );
}
