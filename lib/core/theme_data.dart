import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do/core/Colors.dart';

class AppTheme {
  // Light ThemeData
  static final ThemeData light = _buildLightTheme();

  // Dark ThemeData
  static final ThemeData dark = _buildDarkTheme();

  static ThemeData _buildLightTheme() {
    final base = ThemeData.light();

    final colorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.lightMaincolor,
      onPrimary: AppColors.lightInputs,
      secondary: AppColors.lightSecText,
      onSecondary: AppColors.white,
      background: AppColors.lightBackground,
      onBackground: AppColors.lightMainText,
      surface: AppColors.lightInputs,
      onSurface: AppColors.lightMainText,
      error: AppColors.red, onError: AppColors.white,
    );

    final textTheme = TextTheme(
      displayLarge: GoogleFonts.poppins(
        color: AppColors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: GoogleFonts.poppins(
        color: AppColors.lightMaincolor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: GoogleFonts.poppins(
        color: AppColors.lightMaincolor,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: GoogleFonts.poppins(
        color: AppColors.lightMainText,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: GoogleFonts.poppins(
        color: AppColors.lightMainText,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: GoogleFonts.poppins(
        color: AppColors.lightMaincolor,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      labelLarge: GoogleFonts.poppins(
        color: AppColors.white,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      labelMedium: GoogleFonts.poppins(
        color: AppColors.lightMaincolor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      labelSmall: GoogleFonts.poppins(
        color: AppColors.lightMaincolor,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: GoogleFonts.poppins(
        color: AppColors.lightMaincolor,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: GoogleFonts.poppins(
        color: AppColors.lightSecText,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: GoogleFonts.poppins(
        color: AppColors.lightSecText,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    );

    return base.copyWith(
      primaryColor: colorScheme.primary,
      scaffoldBackgroundColor: AppColors.lightBackground,
      disabledColor: AppColors.disable,
      dividerColor: AppColors.lightStroke,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.lightBackground,
        foregroundColor: AppColors.lightMaincolor,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: textTheme.titleLarge,
        iconTheme: IconThemeData(color: AppColors.lightMaincolor, size: 24),
      ),
      iconTheme: IconThemeData(color: AppColors.lightMaincolor, size: 24),
      textTheme: textTheme,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.lightInputs,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.lightStroke),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.lightStroke),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          textStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colorScheme.primary,
          side: BorderSide(color: AppColors.lightStroke),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          textStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colorScheme.primary,
          textStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.lightInputs,
        selectedItemColor: colorScheme.primary,
        unselectedItemColor: AppColors.lightSecText,
        elevation: 8,
        showUnselectedLabels: true,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
      ),
      cardTheme: CardThemeData(
        color: AppColors.lightInputs,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      dividerTheme: DividerThemeData(color: AppColors.lightStroke, thickness: 1),
      visualDensity: VisualDensity.adaptivePlatformDensity, colorScheme: colorScheme.copyWith(background: colorScheme.background),
    );
  }

  static ThemeData _buildDarkTheme() {
    final base = ThemeData.dark();

    final colorScheme = ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.darkMaincolor,
      onPrimary: AppColors.white,
      secondary: AppColors.darkSecText,
      onSecondary: Colors.black,
      background: AppColors.darkBackground,
      onBackground: AppColors.darkMainText,
      surface: AppColors.darkInputs,
      onSurface: AppColors.darkMainText,
      error: AppColors.red, onError: AppColors.white,
    );

    final textTheme = TextTheme(
      displayLarge: GoogleFonts.poppins(
        color: AppColors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: GoogleFonts.poppins(
        color: AppColors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: GoogleFonts.poppins(
        color: AppColors.darkMaincolor,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: GoogleFonts.poppins(
        color: AppColors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: GoogleFonts.poppins(
        color: AppColors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: GoogleFonts.poppins(
        color: AppColors.darkMaincolor,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      labelLarge: GoogleFonts.poppins(
        color: AppColors.white,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      labelMedium: GoogleFonts.poppins(
        color: AppColors.darkMaincolor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      labelSmall: GoogleFonts.poppins(
        color: AppColors.darkMaincolor,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: GoogleFonts.poppins(
        color: AppColors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: GoogleFonts.poppins(
        color: AppColors.white,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: GoogleFonts.poppins(
        color: AppColors.darkSecText,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    );

    return base.copyWith(
      primaryColor: colorScheme.primary,
      scaffoldBackgroundColor: AppColors.darkBackground,
      disabledColor: AppColors.disable,
      dividerColor: AppColors.darkStroke,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.darkBackground,
        foregroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: textTheme.titleLarge,
        iconTheme: IconThemeData(color: AppColors.darkMaincolor, size: 24),
      ),
      iconTheme: IconThemeData(color: AppColors.darkMaincolor, size: 24),
      textTheme: textTheme,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.darkInputs,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.darkStroke),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.darkStroke),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          textStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colorScheme.primary,
          side: BorderSide(color: AppColors.darkStroke),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          textStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colorScheme.primary,
          textStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.darkInputs,
        selectedItemColor: colorScheme.primary,
        unselectedItemColor: AppColors.darkSecText,
        elevation: 8,
        showUnselectedLabels: true,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
      ),
      cardTheme: CardThemeData(
        color: AppColors.darkInputs,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      dividerTheme: DividerThemeData(color: AppColors.darkStroke, thickness: 1),
      visualDensity: VisualDensity.adaptivePlatformDensity, colorScheme: colorScheme.copyWith(background: colorScheme.background),
    );
  }
}