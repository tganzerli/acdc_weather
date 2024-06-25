import 'package:back_in_black/src/elements/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const _defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide.none);

const double fgimaWidth = 430;

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
          color: Color(0xff333333),
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
        border: _defaultInputBorder,
        focusedBorder: _defaultInputBorder,
        enabledBorder: _defaultInputBorder,
        errorBorder: _defaultInputBorder),
    colorScheme: const ColorScheme.light(
      primary: Color(0xff129166),
      secondary: Color(0xfffcb900),
      tertiary: Color(0xff84cc6d),
      error: Color(0xffEB5757),
    ),
    textTheme: TextTheme(
      displayLarge:
          GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w700),
      displayMedium:
          GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600),
      displaySmall:
          GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w400),
      headlineLarge:
          GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w700),
      headlineMedium:
          GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
      headlineSmall:
          GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w400),
      titleLarge:
          GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w700),
      titleMedium:
          GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
      titleSmall:
          GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w400),
      bodyLarge: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w700),
      bodyMedium:
          GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
      bodySmall: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w400),
      labelLarge:
          GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w700),
      labelMedium:
          GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600),
      labelSmall:
          GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w400),
    ),
    extensions: const [
      BackColors(),
    ],
  );
}
