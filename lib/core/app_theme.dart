import 'package:flutter/material.dart';
import 'package:master_scanner_app/core/app_color.dart';
import 'package:master_scanner_app/gen/fonts.gen.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightAppTheme = ThemeData(
    useMaterial3: false,
    fontFamily: FontFamily.openSans,
    splashColor: AppColor.primaryYellow[10]?.withOpacity(.5),
    highlightColor: AppColor.primaryYellow[10],
    indicatorColor: AppColor.primaryYellow,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(color: AppColor.grey, centerTitle: true),
    dialogTheme: const DialogTheme(
      backgroundColor: AppColor.white,
      alignment: Alignment.center,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
    ),
    sliderTheme: SliderThemeData(
      trackHeight: 3,
      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
      activeTrackColor: Colors.white,
      inactiveTrackColor: Colors.white.withOpacity(.3),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(color: AppColor.primaryGreen),
    // TODO(nam): add theme for input decoration
    // inputDecorationTheme: const InputDecorationTheme(
    //   enabledBorder: CustomOutlineBorder.enabledBorder,
    //   focusedBorder: CustomOutlineBorder.focusedBorder,
    //   errorBorder: CustomOutlineBorder.errorBorder,
    //   border: CustomOutlineBorder.inputBorder,
    // ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(backgroundColor: AppColor.primaryYellow, elevation: 0),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColor.primaryYellow,
      highlightElevation: 1,
      focusElevation: 1,
      hoverElevation: 1,
      elevation: 1,
      disabledElevation: 1,
    ),
    radioTheme: const RadioThemeData(fillColor: MaterialStatePropertyAll(AppColor.primaryYellow)),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppColor.primaryYellow;
        } else {
          return Colors.white;
        }
      }),
      side: const BorderSide(color: AppColor.primaryYellow),
      checkColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.white;
        } else {
          return AppColor.primaryYellow;
        }
      }),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith<Color>((states) {
        if (states.contains(MaterialState.selected)) {
          return AppColor.primaryYellow;
        } else {
          return AppColor.white;
        }
      }),
      trackColor: MaterialStateProperty.all(AppColor.primaryYellow.withOpacity(0.5)),
    ),
    // TODO(nam): add theme for toggleButtonsTheme
    // toggleButtonsTheme: ToggleButtonsThemeData(
    //   color: Colors.grey,
    //   selectedColor: Colors.white,
    //   fillColor: AppColor.primaryYellow,
    //   hoverColor: Colors.grey.withOpacity(0.1),
    //   borderRadius: BorderRadius.circular(8.0),
    // ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: Colors.black54),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
    ),
  );
}
