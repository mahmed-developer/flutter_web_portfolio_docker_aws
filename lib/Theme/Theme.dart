import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF0EA5E9); // Sky blue
  static const secondary = Color(0xFF0891B2); // Cyan
  static const accent = Color(0xFF0EA5E9);// Teal
  static const background = Color(0xFF020617); // Almost black
  static const surface = Color(0xFF0F172A); // Dark slate
  static const surfaceLight = Color(0xFF1E293B); // Medium slate
  static const text = Color(0xFFF1F5F9); // Very light gray
  static const textSecondary = Color(0xFF94A3B8); // Muted gray
  static const gradient1 = Color(0xFF0C4A6E); // Deep blue
  static const gradient2 = Color(0xFF0E7490); // Darker cyan
  static const cardHover = Color(0xFF334155); // Hover state
}

final ThemeData appTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColors.primary,
  colorScheme: ColorScheme.dark(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    surface: AppColors.surface,
    background: AppColors.background,
  ),
  scaffoldBackgroundColor: AppColors.background,
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: AppColors.text),
    displayMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: AppColors.text),
    bodyLarge: TextStyle(fontSize: 16, color: AppColors.text),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.surface,
    foregroundColor: AppColors.text,
    elevation: 0,
  ),
  cardTheme: CardThemeData(
    color: AppColors.surface,
    elevation: 4,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 2,
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColors.primary,
      side: const BorderSide(color: AppColors.primary, width: 1.5),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  ),
  iconTheme: const IconThemeData(
    color: AppColors.primary,
  ),
);