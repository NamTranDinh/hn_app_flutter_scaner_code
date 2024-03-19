import 'package:flutter/material.dart';
import 'package:qr_code_scanner/flavors.dart';

class System {
  static const supportedLocales = [
    Locale('en', 'US'),
    Locale('vi', 'VI'),
  ];

  static const mainLocale = Locale('vi', 'VI');

  static const int receiveTimeout = 60000;
  static const int connectionTimeout = 60000;
  static const header = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
}

class URL {
  static const String _devUrl = '';
  static const String _uatUrl = '';

  static String getBaseURL() => F.appFlavor == Flavor.development ? URL._devUrl : URL._uatUrl;
}
