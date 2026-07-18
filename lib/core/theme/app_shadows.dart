import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppShadows {
  AppShadows._();

  static List<BoxShadow> glow = [
    BoxShadow(
      color: AppColors.primary.withValues(alpha: 0.20),
      blurRadius: 18,
      spreadRadius: 1,
    ),
  ];

  static List<BoxShadow> premium = [
    BoxShadow(
      color: AppColors.gold.withValues(alpha: 0.18),
      blurRadius: 18,
      spreadRadius: 1,
    ),
  ];
}