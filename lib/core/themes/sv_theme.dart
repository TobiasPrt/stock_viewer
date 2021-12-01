import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SVTheme {
  static Color kDark = const Color(0xFF181818);
  static Color kWhite = const Color(0xFFFEFEFE);

  ThemeData getTheme() {
    return ThemeData(
      textTheme: TextTheme(
        headline1: GoogleFonts.montserrat(
          fontSize: 32,
          letterSpacing: 1.1,
          fontWeight: FontWeight.w700,
        ),
        headline2: GoogleFonts.montserrat(
          fontSize: 22,
          letterSpacing: 1.05,
          fontWeight: FontWeight.w700,
        ),
      ).apply(displayColor: kWhite),
      colorScheme: ColorScheme(
        primary: kDark,
        primaryVariant: kDark,
        secondary: kDark,
        secondaryVariant: kDark,
        surface: kDark,
        background: kDark,
        error: kDark,
        onPrimary: kWhite,
        onSecondary: kWhite,
        onSurface: kWhite,
        onBackground: kWhite,
        onError: kWhite,
        brightness: Brightness.dark,
      ),
    );
  }
}
