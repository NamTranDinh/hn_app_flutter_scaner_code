import 'package:get_it/get_it.dart';
import 'package:qr_code_scanner/blocs/splash/splash_cubit.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  /**
   * ┌──────────────────────────────────────────────────────────────────────────
   * │ cubits
   * └──────────────────────────────────────────────────────────────────────────
   */
  getIt.registerFactory(SplashCubit.new);

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
