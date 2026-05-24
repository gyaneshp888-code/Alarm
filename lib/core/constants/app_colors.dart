import 'package:flutter/material.dart';

class AppColors {
  static const Color black = Color(0xFF06070A);
  static const Color darkPurple = Color(0xFF1A1028);
  static const Color neonBlue = Color(0xFF00D1FF);
  static const Color accentPurple = Color(0xFF8B5CF6);
  static const Color softWhite = Color(0xFFEDEDED);
  static const Color glassOverlay = Color(0x14FFFFFF); // rgba(255,255,255,0.08)
  
  static const Gradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [darkPurple, black],
  );

  static const Color cardBackground = Color(0x14FFFFFF);
  static const Color dividerColor = Color(0x1AFFFFFF);
  static const Color textBody = Color(0xFFB0B0B0);
}
