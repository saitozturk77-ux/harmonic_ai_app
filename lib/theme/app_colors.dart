import 'package:flutter/material.dart';

/// ======================================================
///
/// FOREX MATRIX
/// Global Color Theme
///
/// ======================================================

class AppColors {
  AppColors._();

  // ======================================================
  // Background
  // ======================================================

  static const Color background = Color(0xFF05070D);

  static const Color surface = Color(0xFF0D111A);

  static const Color card = Color(0xFF111827);

  static const Color cardDark = Color(0xFF0B1018);

  // ======================================================
  // Borders
  // ======================================================

  static const Color border = Color(0xFF17324A);

  static const Color divider = Color(0xFF223548);

  // ======================================================
  // Primary
  // ======================================================

  static const Color primary = Color(0xFF00D4FF);

  static const Color primaryDark = Color(0xFF0099CC);

  static const Color primaryGlow = Color(0x6600D4FF);

  // ======================================================
  // Success
  // ======================================================

  static const Color success = Color(0xFF7CFF5B);

  static const Color successGlow = Color(0x667CFF5B);

  // ======================================================
  // Danger
  // ======================================================

  static const Color danger = Color(0xFFFF5A5A);

  static const Color dangerGlow = Color(0x66FF5A5A);

  // ======================================================
  // Warning
  // ======================================================

  static const Color warning = Color(0xFFFFC857);

  // ======================================================
  // Premium
  // ======================================================

  static const Color premium = Color(0xFFFFC107);

  static const Color premiumGlow = Color(0x66FFC107);

  // ======================================================
  // AI
  // ======================================================

  static const Color ai = Color(0xFF8A7DFF);

  static const Color aiGlow = Color(0x668A7DFF);

  // ======================================================
  // Text
  // ======================================================

  static const Color textPrimary = Colors.white;

  static const Color textSecondary = Color(0xFFB8C2CC);

  static const Color textMuted = Color(0xFF7E8792);

  // ======================================================
  // Signal Colors
  // ======================================================

  static const Color buy = success;

  static const Color sell = danger;

  static const Color neutral = warning;

  // ======================================================
  // Gradient
  // ======================================================

  static const LinearGradient cardGradient =
      LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF101722),
      Color(0xFF0B1018),
    ],
  );

  static const LinearGradient primaryGradient =
      LinearGradient(
    colors: [
      Color(0xFF00D4FF),
      Color(0xFF0099CC),
    ],
  );

  static const LinearGradient premiumGradient =
      LinearGradient(
    colors: [
      Color(0xFFFFD54F),
      Color(0xFFFFB300),
    ],
  );

  static const LinearGradient successGradient =
      LinearGradient(
    colors: [
      Color(0xFF7CFF5B),
      Color(0xFF36D44A),
    ],
  );
}