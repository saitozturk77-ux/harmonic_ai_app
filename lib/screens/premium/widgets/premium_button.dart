import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_gradients.dart';

class PremiumButton extends StatelessWidget {
  const PremiumButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 60,
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: AppGradients.premiumButton,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.30),
                  blurRadius: 18,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Google Play Billing will be added in Sprint 3.7",
                    ),
                  ),
                );
              },
              icon: const Icon(
                Icons.workspace_premium,
                color: Colors.white,
              ),
              label: const Text(
                "START PREMIUM",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.white,
                shadowColor: Colors.transparent,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 16),

        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.lock_outline,
              size: 16,
              color: Colors.white54,
            ),
            SizedBox(width: 6),
            Text(
              "Secure payment via Google Play",
              style: TextStyle(
                color: Colors.white54,
                fontSize: 13,
              ),
            ),
          ],
        ),

        const SizedBox(height: 18),

        TextButton.icon(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  "Restore Purchase coming soon",
                ),
              ),
            );
          },
          icon: const Icon(
            Icons.restore,
            size: 18,
            color: AppColors.primaryLight,
          ),
          label: const Text(
            "Restore Purchase",
            style: TextStyle(
              color: AppColors.primaryLight,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}