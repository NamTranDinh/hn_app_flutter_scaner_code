import 'package:base_core/base_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:master_scanner_app/blocs/splash/splash_cubit.dart';
import 'package:master_scanner_app/core/app_color.dart';
import 'package:master_scanner_app/di.dart';
import 'package:master_scanner_app/gen/assets.gen.dart';
import 'package:master_scanner_app/routes/routes.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (BuildContext context) => getIt<SplashCubit>()..init(),
        child: Scaffold(
          backgroundColor: AppColor.primaryBlack[90],
          body: BlocListener<SplashCubit, BaseCubitState>(
            listener: (cxt, state) {
              if (state.status == Status.success) {
                Get.offAllNamed(Routes.homeNamedPage);
              }
            },
            child: SizedBox(
              width: context.widthDevice,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset(
                    Assets.anim.animSplash,
                    alignment: Alignment.center,
                    width: context.widthDevice * .8,
                    fit: BoxFit.contain,
                  ),
                  Lottie.asset(
                    Assets.anim.animLoadingQr,
                    height: 160,
                    width: 160,
                    backgroundLoading: true,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
