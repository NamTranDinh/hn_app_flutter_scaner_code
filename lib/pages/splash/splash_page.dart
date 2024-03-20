import 'package:base_core/base_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/blocs/splash/splash_cubit.dart';
import 'package:qr_code_scanner/di.dart';
import 'package:qr_code_scanner/routes/routes.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (BuildContext context) => getIt<SplashCubit>()..init(),
        child: Scaffold(
          body: BlocListener<SplashCubit, BaseCubitState>(
            listener: (cxt, state) {
              if (state.status == Status.success) {
                Get.toNamed(Routes.homeNamedPage);
              }
            },
            child: const Center(
              child: Text('Splash Page'),
            ),
          ),
        ),
      );
}
