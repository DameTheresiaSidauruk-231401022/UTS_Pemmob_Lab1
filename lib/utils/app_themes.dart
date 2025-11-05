import 'package:flutter/material.dart';

class AppThemes {

  static const String _fontFamily = 'Poppins';

  static final _baseTextTheme = const TextTheme(
    displayLarge: TextStyle(fontFamily: _fontFamily, fontSize: 57, fontWeight: FontWeight.bold),
    headlineLarge: TextStyle(fontFamily: _fontFamily, fontSize: 32, fontWeight: FontWeight.bold),
    titleLarge: TextStyle(fontFamily: _fontFamily, fontSize: 22, fontWeight: FontWeight.w600),
    bodyMedium: TextStyle(fontFamily: _fontFamily, fontSize: 16),
  );

  // Tema Terang (Light Theme)
  static final lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: _fontFamily,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF4A148C),
      secondary: Color(0xFFFDD835),
      background: Color(0xFFFAFAFA),
      surface: Colors.white,
    ),
    textTheme: _baseTextTheme.apply(bodyColor: Colors.black87, displayColor: Colors.black),

    cardTheme: CardThemeData(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xFF4A148C),
      foregroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: _baseTextTheme.titleLarge?.copyWith(color: Colors.white),
    ),
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: _fontFamily,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF9C27B0),
      secondary: Color(0xFFFFEB3B),
      background: Color(0xFF121212),
      surface: Color(0xFF1E1E1E),
    ),
    textTheme: _baseTextTheme.apply(bodyColor: Colors.white70, displayColor: Colors.white),

    cardTheme: CardThemeData(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: const Color(0xFF2C2C2C),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xFF1F1F1F),
      foregroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: _baseTextTheme.titleLarge?.copyWith(color: Colors.white),
    ),
  );
}