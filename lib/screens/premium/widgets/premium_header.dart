import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_shadows.dart';

class PremiumHeader extends StatelessWidget {
  const PremiumHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: "premium_logo",
          child: Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: AppShadows.glow,
            ),
            child: ClipOval(
              child: Image.asset(
                "assets/images/logo.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),

        const SizedBox(height: 24),

        const Text(
          "FOREX MATRIX",
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),

        const SizedBox(height: 8),

        const Text(
          "PREMIUM",
          style: TextStyle(
            color: AppColors.gold,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            letterSpacing: 8,
          ),
        ),

        const SizedBox(height: 18),

        const Text(
          "Unlock the Full Power\nof AI Trading",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            height: 1.4,
          ),
        ),

        const SizedBox(height: 14),

        const Text(
          "• Real-time AI Signals\n"
          "• Advanced Market Analysis\n"
          "• Harmonic & Candlestick AI\n"
          "• Unlimited Premium Alerts",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white70,
            fontSize: 14,
            height: 1.7,
          ),
        ),

        const SizedBox(height: 32),
      ],
    );
  }
}