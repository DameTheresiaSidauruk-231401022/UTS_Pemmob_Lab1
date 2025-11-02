// lib/utils/app_themes.dart

import 'package:flutter/material.dart';

class AppThemes {
  // Base TextStyle
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
      primary: Color(0xFF4A148C), // Deep Purple
      secondary: Color(0xFFFDD835), // Yellow Accent
      background: Color(0xFFFAFAFA), // Pengganti Colors.grey[50]
      surface: Colors.white,
    ),
    textTheme: _baseTextTheme.apply(bodyColor: Colors.black87, displayColor: Colors.black),
    // REVISI: Mengganti CardTheme menjadi CardThemeData
    cardTheme: CardThemeData(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white, // Menetapkan warna eksplisit untuk menghindari null safety
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xFF4A148C),
      foregroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: _baseTextTheme.titleLarge?.copyWith(color: Colors.white),
    ),
  );

  // Tema Gelap (Dark Theme) (Bonus: 1)
  static final darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: _fontFamily,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF9C27B0), // Purple
      secondary: Color(0xFFFFEB3B), // Yellow Accent
      background: Color(0xFF121212), // Pengganti Colors.grey[900]
      surface: Color(0xFF1E1E1E), // Dark surface color
    ),
    textTheme: _baseTextTheme.apply(bodyColor: Colors.white70, displayColor: Colors.white),
    // REVISI: Mengganti CardTheme menjadi CardThemeData
    cardTheme: CardThemeData(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: const Color(0xFF2C2C2C), // Menetapkan warna eksplisit untuk menghindari null safety
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xFF1F1F1F),
      foregroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: _baseTextTheme.titleLarge?.copyWith(color: Colors.white),
    ),
  );
}