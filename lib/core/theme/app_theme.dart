import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nova_alarm/core/constants/app_colors.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,

      brightness: Brightness.dark,

      scaffoldBackgroundColor: AppColors.black,

      primaryColor: AppColors.neonBlue,

      colorScheme: const ColorScheme.dark(
        primary: AppColors.neonBlue,
        secondary: AppColors.accentPurple,
        surface: AppColors.darkPurple,
      ),

      textTheme: GoogleFonts.interTextTheme(
        ThemeData.dark().textTheme,
      ).copyWith(
        displayLarge: GoogleFonts.poppins(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: AppColors.softWhite,
        ),

        headlineMedium: GoogleFonts.poppins(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: AppColors.softWhite,
        ),

        bodyLarge: GoogleFonts.inter(
          fontSize: 16,
          color: AppColors.softWhite,
        ),

        bodyMedium: GoogleFonts.inter(
          fontSize: 14,
          color: AppColors.textBody,
        ),
      ),

      cardTheme: CardTheme(
        color: AppColors.glassOverlay,

        elevation: 0,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),

          side: const BorderSide(
            color: AppColors.dividerColor,
            width: 1,
          ),
        ),
      ),
    );
  }
}
