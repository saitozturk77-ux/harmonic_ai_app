import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppGradients {
  AppGradients._();

  static const LinearGradient background = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.background,
      Color(0xFF081420),
      AppColors.background,
    ],
  );

  static const LinearGradient premiumButton = LinearGradient(
    colors: [
      Color(0xFF00BCD4),
      Color(0xFF00E5FF),
    ],
  );

  static const LinearGradient premiumCard = LinearGradient(
    colors: [
      Color(0xFF112233),
      Color(0xFF081420),
    ],
  );
}