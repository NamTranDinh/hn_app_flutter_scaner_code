import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:qr_code_scanner/config/system.dart';
import 'package:qr_code_scanner/core/app_theme.dart';
import 'package:qr_code_scanner/flavors.dart';
import 'package:qr_code_scanner/routes/app_routes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        title: F.title,
        navigatorObservers: [ChuckerFlutter.navigatorObserver],
        getPages: AppRouter().routes,
        useInheritedMediaQuery: true,
        debugShowCheckedModeBanner: false,
        locale: System.mainLocale,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        themeMode: ThemeMode.light,
        theme: AppTheme.lightAppTheme,
      );
}
