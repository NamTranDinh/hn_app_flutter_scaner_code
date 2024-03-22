import 'package:flutter/material.dart';

class AppColor {
  static const MaterialColor primaryGreen = MaterialColor(
    0xFF669835,
    <int, Color>{
      100: Color(0xFF669835),
      90: Color(0xFF6B9F4B),
      80: Color(0xFF70B35E),
      70: Color(0xFF75C771),
      60: Color(0xFF7ADD85),
      50: Color(0xFF7FF499),
      40: Color(0xFF84F7AC),
      30: Color(0xFF89FCC0),
      20: Color(0xFF8EFED3),
      10: Color(0xFF94FFEA),
    },
  );

  static const MaterialColor primaryYellow = MaterialColor(
    0xFFF6A609,
    <int, Color>{
      100: Color(0xFFF6A609),
      90: Color(0xFFF7AF22),
      80: Color(0xFFF8B83A),
      70: Color(0xFFF9C153),
      60: Color(0xFFF9C153),
      50: Color(0xFFFACA6B),
      40: Color(0xFFFBD384),
      30: Color(0xFFFBDB9D),
      20: Color(0xFFFCE4B5),
      10: Color(0xFFFDEDCE),
    },
  );

  static const MaterialColor primaryBlue = MaterialColor(
    0xFF0259A3,
    <int, Color>{
      100: Color(0xFF0259A3),
      90: Color(0xFF0464B7),
      80: Color(0xFF056FCB),
      70: Color(0xFF067AE0),
      60: Color(0xFF0785F4),
      50: Color(0xFF0990F9),
      40: Color(0xFF0AAAFB),
      30: Color(0xFF0CB4FC),
      20: Color(0xFF0DBFFD),
      10: Color(0xFF0FC9FE),
    },
  );

  static const MaterialColor primaryBlack = MaterialColor(
    0xFF070504,
    <int, Color>{
      100: Color(0xFF070504),
      90: Color(0xFF201E1E),
      80: Color(0xFF393736),
      70: Color(0xFF525050),
      60: Color(0xFF6A6968),
      50: Color(0xFF838282),
      40: Color(0xFF9C9B9B),
      30: Color(0xFFB5B4B4),
      20: Color(0xFFCDCDCD),
      10: Color(0xFFF0F1F3),
    },
  );
  static const MaterialColor warning = MaterialColor(
    0xFFF6A609,
    <int, Color>{
      100: Color(0xFFF6A609), // default
      120: Color(0xFFE89806), // dark
      80: Color(0xFFFFBC1F), // light
    },
  );
  static const MaterialColor success = MaterialColor(
    0xFF2AC769,
    <int, Color>{
      100: Color(0xFF2AC769), // default
      120: Color(0xFF1AB759), // dark
      80: Color(0xFF40DD7F), // light
    },
  );
  static const MaterialColor error = MaterialColor(
    0xFFFB4E4E,
    <int, Color>{
      100: Color(0xFFFB4E4E), // default
      120: Color(0xFFE93C3C), // dark
      80: Color(0xFFFF6262), // light
    },
  );

  static const Color pureBlack = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color backgroundPrimary = Color(0xFFF6F7FB);
  static const Color rangeSliderInactiveColor = Color(0xFFCCCCCC);
  static const Color blackD9 = Color(0xFFD9D9D9);
  static const Color dialogShadowColor = Color(0xFFFEEAEC);
  static const Color popupShadowColor = Color(0xFFFBD4D7);
  static final Color bottomSheetBarrierColor = const Color(0xFFD9D9D9).withOpacity(0.5);
  static final Color hiringItemShadowColor = const Color(0xFF000000).withOpacity(0.25);
  static const Color transparent = Color(0x00000000);
  static const Color statusCompleted = Color(0xFFC8FEA8);
  static const Color statusUpdating = Color(0xFFFFFEBE);
  static const Color statusOverdue = Color(0xFFF9BEC4);
  static const Color boxShadow = Color(0xffDDDDDD);
  static const Color pinkPrimary = Color(0xffF47F88);
  static const Color grey = Color(0xff333333);
  static const Color lightGrey2 = Color(0xff3B3B3B);
  static const Color lightGrey = Color(0xffA4A4A4);
  static const Color lightGrey3 = Color(0xff3C3C3C);

  static const Color naviBlue = Color(0xff2D3047);
  static const Color whiteLight = Color(0xffd9d9d9);
  static const Color whiteLight2 = Color(0xffE2E2E2);
  static const Color whiteLight3 = Color(0xffC3C7C7);

  /// *** Recommended Usage:
  /// Title texts, captions, input fields and everywhere else where black is required: AppColor.black
  /// Secondary text: AppColor.black[80]
  /// Inactive states: AppColor.black[60]
  /// Default texts in text field: AppColor.black[40]
  /// Dividers & borders, disabled states: AppColor.black[20]
  /// Background color: AppColor.black[10]
  /// Primary actions, buttons, border button and links: AppColor.primary
  /// Error: AppColor.error
  /// Warning: AppColor.warning
  /// Success: AppColor.success
}
