import 'package:blogger/app/core/values/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData lightMode(BuildContext context) {
    return ThemeData(
        fontFamily: "Inter",
        textTheme: const TextTheme(
          headline3: TextStyle(
            color: Color(0xFF1A1A1A),
            fontSize: 24,
            fontWeight: FontWeight.w700,
            height: 1.5,
          ),
          headline6: TextStyle(
            color: Color(0xFF0A1330),
            fontSize: 18,
            fontWeight: FontWeight.w600,
            height: 1.5,
          ),
          button: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            height: 1.2,
          ),
          caption: TextStyle(
            color: Color(0xFF333333),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          bodyText2: TextStyle(
            color: Color(0xFF333333),
            fontSize: 14,
            fontWeight: FontWeight.w600,
            height: 1.2,
          ),
          bodyText1: TextStyle(
            color: Color(0xFF344054),
            fontSize: 14,
            fontWeight: FontWeight.w500,
            height: 1.2,
          ),
          subtitle1: TextStyle(
            color: Color(0xFF7B7B7B),
            fontSize: 12,
            fontWeight: FontWeight.w500,
            height: 1.2,
          ),
          subtitle2: TextStyle(
            color: Color(0xFF7B7B7B),
            fontSize: 10,
            fontWeight: FontWeight.w500,
            height: 1.2,
          ),
        ));
  }

  static CupertinoThemeData cupertinoLight() {
    return const CupertinoThemeData(
        primaryColor: kPrimaryColor,
        barBackgroundColor: CupertinoColors.systemBackground,
        brightness: Brightness.light,
        scaffoldBackgroundColor: CupertinoColors.systemBackground,
        textTheme: CupertinoTextThemeData());
  }

  static ThemeData darkMode(BuildContext context) {
    return ThemeData();
  }
}
