import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/config/system.dart';
import 'package:qr_code_scanner/core/app_theme.dart';
import 'package:qr_code_scanner/flavors.dart';
import 'package:qr_code_scanner/routes/app_routes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        title: F.title,
        routerDelegate: AppRouter.router.routerDelegate,
        routeInformationProvider: AppRouter.router.routeInformationProvider,
        routeInformationParser: AppRouter.router.routeInformationParser,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: System.mainLocale,
        themeMode: ThemeMode.light,
        theme: AppTheme.lightAppTheme,
      );
}
