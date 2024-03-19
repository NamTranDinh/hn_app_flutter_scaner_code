import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/common/widgets/item_radio_setting.dart';
import 'package:qr_code_scanner/config/system.dart';
import 'package:qr_code_scanner/core/app_theme.dart';
import 'package:qr_code_scanner/flavors.dart';
import 'package:qr_code_scanner/gen/assets.gen.dart';

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
          body: Center(
            child: ItemRadioSetting(
              title: "Beep",
              description: "Beep when scan is done",
              iconSrc: Assets.icons.bell,
              onchange: (v) {},
            ),
          ),
        ),
      );
}
