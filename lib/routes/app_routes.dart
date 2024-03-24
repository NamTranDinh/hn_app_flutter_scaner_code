import 'package:flutter/cupertino.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_navigation/src/routes/custom_transition.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/route_middleware.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:master_scanner_app/di.dart';
import 'package:master_scanner_app/pages/home/my_home_page.dart';
import 'package:master_scanner_app/pages/splash/splash_page.dart';
import 'package:master_scanner_app/routes/routes.dart';

final getPage = getIt.get<AppRouter>();

class AppRouter {
  List<GetPage> get routes => <GetPage>[
        _getPage(
          name: Routes.splashNamedPage,
          page: () => const SplashPage(),
        ),
        _getPage(
          name: Routes.homeNamedPage,
          page: () => const MyHomePage(),
        ),
      ];

  /// Here are some commonly used attributes,
  /// if you need more you can add them below
  GetPage _getPage({
    required String name,
    required Widget Function() page,
    Object? args,
    Transition? transition,
    CustomTransition? customTransition,
    Duration? transitionDuration,
    List<Bindings>? bindings,
    bool? fullscreenDialog,
    bool? preventDuplicates,
    bool? opaque,
    bool? maintainState,
    Curve? curve,
    Alignment? alignment,
    List<GetMiddleware>? middlewares,
  }) =>
      GetPage(
        name: name,
        page: page,
        arguments: args,
        bindings: bindings ?? [],
        middlewares: middlewares,
        fullscreenDialog: fullscreenDialog ?? false,
        preventDuplicates: preventDuplicates ?? true,
        maintainState: maintainState ?? true,
        opaque: opaque ?? true,
        curve: curve ?? Curves.linear,
        alignment: alignment,
        transition: transition ?? Transition.rightToLeft,
        transitionDuration: transitionDuration,
        customTransition: customTransition,
        /** Additional attributes*/
      );
}
