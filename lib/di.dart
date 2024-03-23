import 'package:get_it/get_it.dart';
import 'package:qr_code_scanner/blocs/genarate/generate_page_cubit.dart';
import 'package:qr_code_scanner/blocs/navbar/navbar_cubit.dart';
import 'package:qr_code_scanner/blocs/splash/splash_cubit.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  /**
   * ┌──────────────────────────────────────────────────────────────────────────
   * │ cubits
   * └──────────────────────────────────────────────────────────────────────────
   */
  getIt
    ..registerFactory(SplashCubit.new)
    ..registerFactory(NavbarCubit.new)
    ..registerFactory(GeneratePageCubit.new);

  /**
   * ┌──────────────────────────────────────────────────────────────────────────
   * │ repositories
   * └──────────────────────────────────────────────────────────────────────────
   */

  /**
   * ┌──────────────────────────────────────────────────────────────────────────
   * │ remote data sources
   * └──────────────────────────────────────────────────────────────────────────
   */
}
