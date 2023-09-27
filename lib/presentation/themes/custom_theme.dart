import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../size_config/size_config.dart';

class Styles {
  static ColorScheme myColorScheme = ColorScheme.fromSeed(
    seedColor: const Color(0xFF08c4b2),
  );

  static final ElevatedButtonThemeData _elevatedButtonThemeData =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.getProportionateScreenWidth(12),
        vertical: SizeConfig.getProportionateScreenHeight(10),
      ),
      foregroundColor: myColorScheme.primary,
      backgroundColor: myColorScheme.primaryContainer,
    ),
  );

  static ThemeData lightTheme = ThemeData().copyWith(
    useMaterial3: true,
    colorScheme: myColorScheme,
    appBarTheme: const AppBarTheme().copyWith(
      centerTitle: true,
      foregroundColor: myColorScheme.primary,
      backgroundColor: myColorScheme.onPrimary,
    ),
    elevatedButtonTheme: _elevatedButtonThemeData,
    dropdownMenuTheme: const DropdownMenuThemeData().copyWith(
      textStyle: GoogleFonts.robotoMono(
        color: Colors.white,
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
    elevatedButtonTheme: _elevatedButtonThemeData,
    dropdownMenuTheme: const DropdownMenuThemeData().copyWith(
      textStyle: GoogleFonts.robotoMono(
        color: Colors.white,
      ),
    ),
    textTheme: GoogleFonts.robotoMonoTextTheme(),
  );
}
