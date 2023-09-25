import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  static ColorScheme myColorScheme = ColorScheme.fromSeed(
    seedColor: const Color(0xFF08c4b2),
  );

  static ThemeData lightTheme = ThemeData().copyWith(
    useMaterial3: true,
    colorScheme: myColorScheme,
    appBarTheme: const AppBarTheme().copyWith(
      centerTitle: true,
      foregroundColor: myColorScheme.primary,
      backgroundColor: myColorScheme.onPrimary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 16),
        foregroundColor: myColorScheme.primary,
        backgroundColor: myColorScheme.primaryContainer,
      ),
    ),
    textTheme: GoogleFonts.robotoMonoTextTheme(),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    useMaterial3: true,
    colorScheme: myColorScheme,
    scaffoldBackgroundColor: const Color(0xFF121212),
    appBarTheme: const AppBarTheme().copyWith(
      centerTitle: true,
      foregroundColor: Colors.white,
      backgroundColor: myColorScheme.onPrimaryContainer,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 16),
        foregroundColor: myColorScheme.primary,
        backgroundColor: myColorScheme.primaryContainer,
      ),
    ),
    textTheme: GoogleFonts.robotoMonoTextTheme(),
  );
}
