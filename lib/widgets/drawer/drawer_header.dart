import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/premium/premium_service.dart';
import '../../core/theme/app_colors.dart';

class DrawerHeaderWidget extends StatelessWidget {
  const DrawerHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final premium = context.watch<PremiumService>();

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 28, 20, 24),
      child: Column(
        children: [
          Image.asset(
            'assets/images/logo.png',
            width: 78,
            height: 78,
            fit: BoxFit.contain,
          ),

          const SizedBox(height: 14),

          const Text(
            "FOREX MATRIX",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),

          const SizedBox(height: 6),

          const Text(
            "AI Trading Intelligence",
            style: TextStyle(
              color: AppColors.primaryLight,
              fontSize: 14,
              letterSpacing: 1,
            ),
          ),

          const SizedBox(height: 6),

          const Text(
            "Version 1.0.0",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),

          const SizedBox(height: 14),

          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 7,
            ),
            decoration: BoxDecoration(
              color: premium.isPremium
                  ? AppColors.gold.withValues(alpha: 0.18)
                  : AppColors.primary.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: premium.isPremium
                    ? AppColors.gold
                    : AppColors.primaryLight,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  premium.isPremium
                      ? Icons.workspace_premium
                      : Icons.lock_open,
                  size: 16,
                  color: premium.isPremium
                      ? AppColors.gold
                      : AppColors.primaryLight,
                ),

                const SizedBox(width: 6),

                Text(
                  premium.isPremium
                      ? "PREMIUM MEMBER"
                      : "FREE PLAN",
                  style: TextStyle(
                    color: premium.isPremium
                        ? AppColors.gold
                        : AppColors.primaryLight,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    letterSpacing: .5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}