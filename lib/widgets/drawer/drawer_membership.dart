import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/premium/premium_service.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_gradients.dart';
import '../../screens/premium/premium_screen.dart';

class DrawerMembership extends StatelessWidget {
  const DrawerMembership({super.key});

  @override
  Widget build(BuildContext context) {
    final premium = context.watch<PremiumService>();

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          Navigator.pop(context);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const PremiumScreen(),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            gradient: premium.isPremium
                ? AppGradients.premiumButton
                : const LinearGradient(
                    colors: [
                      Color(0xFF00BCD4),
                      Color(0xFF006064),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: (premium.isPremium
                        ? AppColors.gold
                        : AppColors.primary)
                    .withValues(alpha: 0.25),
                blurRadius: 16,
                spreadRadius: 1,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(
                premium.isPremium
                    ? Icons.verified
                    : Icons.workspace_premium,
                color: premium.isPremium
                    ? AppColors.gold
                    : Colors.amber,
                size: 34,
              ),

              const SizedBox(width: 14),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      premium.isPremium
                          ? "PREMIUM ACTIVE"
                          : "FOREX MATRIX PREMIUM",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      premium.isPremium
                          ? "Your subscription is active"
                          : "Gold • Silver • Crypto • AI Engines",
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),

              Icon(
                premium.isPremium
                    ? Icons.check_circle
                    : Icons.arrow_forward_ios,
                color: Colors.white,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}