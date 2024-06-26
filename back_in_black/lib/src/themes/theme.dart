import 'package:back_in_black/src/elements/color/colors.dart';
import 'package:flutter/material.dart';

const _defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide.none);

ThemeData lightTheme(BuildContext context) {
  return ThemeData(
    inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        errorStyle: TextStyle(
          color: Color(0xffEB5757),
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        fillColor: Color(0xffF2F2F9),
        labelStyle: TextStyle(
          color: Color(0xfffafbdb),
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
        border: _defaultInputBorder,
        focusedBorder: _defaultInputBorder,
        enabledBorder: _defaultInputBorder,
        errorBorder: _defaultInputBorder),
    colorScheme: const ColorScheme.light(
      primary: Color(0xfffafbdb),
      secondary: Color(0xff44aad5),
      tertiary: Color(0xff84cc6d),
      error: Color(0xffEB5757),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontFamily: 'SofiaPro',
          package: 'back_in_black',
          fontSize: 80,
          fontWeight: FontWeight.w400,
          color: Color(0xfffafbdb)),
      displayMedium: TextStyle(
          fontFamily: 'SofiaPro',
          package: 'back_in_black',
          fontSize: 42,
          fontWeight: FontWeight.w400,
          color: Color(0xfffafbdb)),
      displaySmall: TextStyle(
          fontFamily: 'SofiaPro',
          package: 'back_in_black',
          fontSize: 36,
          fontWeight: FontWeight.w400,
          color: Color(0xfffafbdb)),
      headlineLarge: TextStyle(
          fontFamily: 'SofiaPro',
          package: 'back_in_black',
          fontSize: 32,
          fontWeight: FontWeight.w400,
          color: Color(0xfffafbdb)),
      headlineMedium: TextStyle(
          fontFamily: 'SofiaPro',
          package: 'back_in_black',
          fontSize: 28,
          fontWeight: FontWeight.w400,
          color: Color(0xfffafbdb)),
      headlineSmall: TextStyle(
          fontFamily: 'SofiaPro',
          package: 'back_in_black',
          fontSize: 24,
          fontWeight: FontWeight.w400,
          color: Color(0xfffafbdb)),
      titleLarge: TextStyle(
          fontFamily: 'SofiaPro',
          package: 'back_in_black',
          fontSize: 21,
          fontWeight: FontWeight.w500,
          color: Color(0xfffafbdb)),
      titleMedium: TextStyle(
          fontFamily: 'SofiaPro',
          package: 'back_in_black',
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
          color: Color(0xfffafbdb)),
      titleSmall: TextStyle(
          fontFamily: 'SofiaPro',
          package: 'back_in_black',
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
          color: Color(0xfffafbdb)),
      bodyLarge: TextStyle(
          fontFamily: 'SofiaPro',
          package: 'back_in_black',
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
          color: Color(0xfffafbdb)),
      bodyMedium: TextStyle(
          fontFamily: 'SofiaPro',
          package: 'back_in_black',
          fontSize: 12,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
          color: Color(0xfffafbdb)),
      bodySmall: TextStyle(
          fontFamily: 'SofiaPro',
          package: 'back_in_black',
          fontSize: 10,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
          color: Color(0xfffafbdb)),
      labelLarge: TextStyle(
          fontFamily: 'SofiaPro',
          package: 'back_in_black',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.15,
          color: Color(0xfffafbdb)),
      labelMedium: TextStyle(
          fontFamily: 'SofiaPro',
          package: 'back_in_black',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
          color: Color(0xfffafbdb)),
      labelSmall: TextStyle(
          fontFamily: 'SofiaPro',
          package: 'back_in_black',
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
          color: Color(0xfffafbdb)),
    ),
    extensions: const [
      BackColors(),
    ],
  );
}
