import 'package:flutter/material.dart';

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
    // textTheme: ThemeData().textTheme.copyWith()
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    useMaterial3: true,
    colorScheme: myColorScheme,
    appBarTheme: const AppBarTheme().copyWith(
      centerTitle: true,
      foregroundColor: myColorScheme.primaryContainer,
      backgroundColor: myColorScheme.onPrimaryContainer,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 16),
        foregroundColor: myColorScheme.onPrimary,
        backgroundColor: myColorScheme.onPrimaryContainer,
      ),
    ),
  );
}
