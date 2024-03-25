import 'package:flutter/cupertino.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_navigation/src/routes/custom_transition.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/route_middleware.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:master_scanner_app/di.dart';
import 'package:master_scanner_app/pages/general_code/generate_business.dart';
import 'package:master_scanner_app/pages/general_code/generate_contact.dart';
import 'package:master_scanner_app/pages/general_code/generate_email.dart';
import 'package:master_scanner_app/pages/general_code/generate_event.dart';
import 'package:master_scanner_app/pages/general_code/generate_intagram.dart';
import 'package:master_scanner_app/pages/general_code/generate_location.dart';
import 'package:master_scanner_app/pages/general_code/generate_phone.dart';
import 'package:master_scanner_app/pages/general_code/generate_text.dart';
import 'package:master_scanner_app/pages/general_code/generate_twitter.dart';
import 'package:master_scanner_app/pages/general_code/generate_web.dart';
import 'package:master_scanner_app/pages/general_code/generate_whatsapp.dart';
import 'package:master_scanner_app/pages/general_code/generate_wifi.dart';
import 'package:master_scanner_app/pages/home/my_home_page.dart';
import 'package:master_scanner_app/pages/scanner/qr_code_scanner_page.dart';
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
        _getPage(
          name: Routes.generateQrText,
          page: () => const GenerateText(),
        ),
        _getPage(
          name: Routes.generateQrEmail,
          page: () => const GenerateEmail(),
        ),
        _getPage(
          name: Routes.generateQrWifi,
          page: () => const GenerateWifi(),
        ),
        _getPage(
          name: Routes.generateQrInstagram,
          page: () => const GenerateInstagram(),
        ),
        _getPage(
          name: Routes.generateQrWhatsApp,
          page: () => const GenerateWhatsApp(),
        ),
        _getPage(
          name: Routes.generateQrWeb,
          page: () => const GenerateWeb(),
        ),
        _getPage(
          name: Routes.generateQrPhone,
          page: () => const GeneratePhone(),
        ),
        _getPage(
          name: Routes.generateQrEvent,
          page: () => const GenerateEvent(),
        ),
        _getPage(
          name: Routes.generateQrTwitter,
          page: () => const GenerateTwitter(),
        ),
        _getPage(
          name: Routes.generateQrContact,
          page: () => const GenerateContact(),
        ),
        _getPage(
          name: Routes.generateQrBusiness,
          page: () => const GenerateBusiness(),
        ),
        _getPage(
          name: Routes.generateQrLocation,
          page: () => const GenerateLocation(),
        ),
        _getPage(
          name: Routes.qrCodeScannerPage,
          page: () => const QrCodeScannerPage(),
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
        transitionDuration: transitionDuration ?? const Duration(milliseconds: 250),
        customTransition: customTransition,
        /** Additional attributes*/
      );
}
