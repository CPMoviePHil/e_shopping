import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Google fonts constant setting: https://fonts.google.com/
TextTheme kTextTheme(theme, String? language) {
  switch (language) {
    case 'zh':
      return GoogleFonts.montserratTextTheme(theme);
    case 'en':
      return GoogleFonts.ralewayTextTheme(theme);
    default:
      return GoogleFonts.ralewayTextTheme(theme);
  }
}

TextTheme kHeadlineTheme(theme, [language = 'en']) {
  switch (language) {
    case 'zh':
      return GoogleFonts.montserratTextTheme(theme);
    case 'en':
      return GoogleFonts.ralewayTextTheme(theme);
    default:
      return GoogleFonts.montserratTextTheme(theme);
  }
}
