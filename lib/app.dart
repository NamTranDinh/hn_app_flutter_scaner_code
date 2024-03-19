import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/config/system.dart';
import 'package:qr_code_scanner/core/app_theme.dart';
import 'package:qr_code_scanner/flavors.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: F.title,
        navigatorObservers: [ChuckerFlutter.navigatorObserver],
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: System.mainLocale,
        themeMode: ThemeMode.light,
        theme: AppTheme.lightAppTheme,
        home: Scaffold(
          appBar: AppBar(title: const Text('Hello')),
        ),
      );
}
