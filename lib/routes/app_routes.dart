import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_code_scanner/pages/home/my_home_page.dart';
import 'package:qr_code_scanner/pages/not_found_page/not_found_page.dart';
import 'package:qr_code_scanner/pages/splash/splash_page.dart';
import 'package:qr_code_scanner/routes/routes.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  // static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter _router = GoRouter(
    // initialLocation: Routes.splashNamedPage,
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: Routes.splashNamedPage,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: Routes.homeNamedPage,
        builder: (context, state) => const MyHomePage(),
      ),
    ],
    errorBuilder: (context, state) => const NotFoundPage(),
  );

  static GoRouter get router => _router;
}
