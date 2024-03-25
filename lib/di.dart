import 'package:get_it/get_it.dart';
import 'package:master_scanner_app/blocs/navbar/navbar_cubit.dart';
import 'package:master_scanner_app/blocs/splash/splash_cubit.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  /**
   * ┌──────────────────────────────────────────────────────────────────────────
   * │ cubits
   * └──────────────────────────────────────────────────────────────────────────
   */
  getIt
    ..registerFactory(SplashCubit.new)
    ..registerFactory(NavbarCubit.new);

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
