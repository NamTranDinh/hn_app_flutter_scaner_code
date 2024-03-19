import 'dart:async';

import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/app.dart';
import 'package:qr_code_scanner/common/blocs/bloc_observer.dart';
import 'package:qr_code_scanner/config/system.dart';
import 'package:qr_code_scanner/di.dart';

FutureOr<void> main() async {
  ChuckerFlutter.showOnRelease = false;
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  if (kDebugMode) Bloc.observer = const AppBlocObserver();
  await init();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  runApp(
    EasyLocalization(
      supportedLocales: System.supportedLocales,
      path: 'assets/i18n',
      fallbackLocale: System.mainLocale,
      child: const App(),
    ),
  );
}
