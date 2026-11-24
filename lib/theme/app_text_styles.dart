import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static const String fontFamily = 'Inter';

  static const TextStyle displayAlert = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 56,
    height: 1.071,
    letterSpacing: -0.56,
    color: AppColorsDark.textPrimary,
  );

  static const TextStyle displayTimer = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 48,
    height: 1.167,
    letterSpacing: 0,
    color: AppColorsDark.textPrimary,
  );

  static const TextStyle displayScore = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 40,
    height: 1.1,
    letterSpacing: -0.4,
    color: AppColorsDark.textPrimary,
  );

  static const TextStyle headingH1 = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 32,
    height: 1.25,
    letterSpacing: -0.32,
    color: AppColorsDark.textPrimary,
  );

  static const TextStyle headingH2 = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 24,
    height: 1.333,
    letterSpacing: 0,
    color: AppColorsDark.textPrimary,
  );

  static const TextStyle headingH3 = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 20,
    height: 1.4,
    letterSpacing: 0,
    color: AppColorsDark.textPrimary,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 18,
    height: 1.556,
    letterSpacing: 0,
    color: AppColorsDark.textPrimary,
  );

  static const TextStyle bodyDefault = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 1.5,
    letterSpacing: 0,
    color: AppColorsDark.textPrimary,
  );

  static const TextStyle bodyStrong = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 16,
    height: 1.5,
    letterSpacing: 0,
    color: AppColorsDark.textPrimary,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 1.429,
    letterSpacing: 0,
    color: AppColorsDark.textSecondary,
  );

  static const TextStyle labelLarge = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 18,
    height: 1.333,
    letterSpacing: 0,
    color: AppColorsDark.textOnAccent,
  );

  static const TextStyle labelDefault = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 14,
    height: 1.429,
    letterSpacing: 0,
    color: AppColorsDark.textPrimary,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 12,
    height: 1.333,
    letterSpacing: 0,
    color: AppColorsDark.textSecondary,
  );

  static const TextStyle overline = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 12,
    height: 1.333,
    letterSpacing: 0.72,
    color: AppColorsDark.textSecondary,
  );
}
