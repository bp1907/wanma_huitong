import 'package:flutter/material.dart';

///颜色
class WMColors {

  static const String primaryValueString = "#24292E";
  static const String primaryLightValueString = "#42464b";
  static const String primaryDarkValueString = "#121917";

  static const int primaryValue = 0xFF24292E;
  static const int primaryLightValue = 0xFF42464b;
  static const int primaryDarkValue = 0xFF121917;

  static const int textWhite = 0xFFFFFFFF;
  static const int miWhite = 0xffececec;
  static const int white = 0xFFFFFFFF;
  static const int actionBlue = 0xff267aff;
  static const int subTextColor = 0xff959595;
  static const int subLightTextColor = 0xffc4c4c4;

  static const int mainBackgroundColor = miWhite;

  static const int mainTextColor = primaryDarkValue;
  static const int textColorWhite = white;

  static const MaterialColor primarySwatch = const MaterialColor(
      primaryValue,
    const <int, Color>{
      50: const Color(primaryLightValue),
      100: const Color(primaryLightValue),
      200: const Color(primaryLightValue),
      300: const Color(primaryLightValue),
      400: const Color(primaryLightValue),
      500: const Color(primaryValue),
      600: const Color(primaryDarkValue),
      700: const Color(primaryDarkValue),
      800: const Color(primaryDarkValue),
      900: const Color(primaryDarkValue),
    },
  );
}

///文本样式
class WMConstant {
  static const lagerTextSize = 30.0;
  static const bigTextSize = 23.0;
  static const normalTextSize = 18.0;
  static const middleTextSize = 16.0;
  static const smallTextSize = 14.0;
  static const minTextSize = 12.0;

  static const minText = TextStyle(
    color: Color(WMColors.subLightTextColor),
    fontSize: minTextSize,
  );

  static const smallText = TextStyle(
    color: Color(WMColors.mainTextColor),
    fontSize: smallTextSize,
  );

  static const smallTextWhite = TextStyle(
    color: Color(WMColors.textColorWhite),
    fontSize: smallTextSize,
  );

  static const smallTextBold = TextStyle(
    color: Color(WMColors.mainTextColor),
    fontSize: smallTextSize,
    fontWeight: FontWeight.bold,
  );

  static const smallSubLightText = TextStyle(
    color: Color(WMColors.subLightTextColor),
    fontSize: smallTextSize,
  );

  static const middleText = TextStyle(
    color: Color(WMColors.mainTextColor),
    fontSize: middleTextSize,
  );

  static const middleTextWhite = TextStyle(
    color: Color(WMColors.textColorWhite),
    fontSize: middleTextSize,
  );

  static const normalText = TextStyle(
    color: Color(WMColors.mainTextColor),
    fontSize: normalTextSize,
  );

  static const normalTextWhite = TextStyle(
    color: Color(WMColors.textColorWhite),
    fontSize: normalTextSize,
  );

  static const normalTextLight = TextStyle(
    color: Color(WMColors.primaryLightValue),
    fontSize: normalTextSize,
  );

  static const bigText = TextStyle(
    color: Color(WMColors.mainTextColor),
    fontSize: bigTextSize,
  );

  static const bigTextWhite = TextStyle(
    color: Color(WMColors.textColorWhite),
    fontSize: bigTextSize,
  );

  static const lagerText = TextStyle(
    color: Color(WMColors.mainTextColor),
    fontSize: lagerTextSize,
  );

  static const lagerTextWhite = TextStyle(
    color: Color(WMColors.textColorWhite),
    fontSize: lagerTextSize,
  );

}