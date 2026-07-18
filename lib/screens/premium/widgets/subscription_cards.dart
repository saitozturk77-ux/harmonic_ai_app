import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_shadows.dart';
import '../../../shared/widgets/glass_card.dart';

class SubscriptionCards extends StatefulWidget {
  const SubscriptionCards({super.key});

  @override
  State<SubscriptionCards> createState() => _SubscriptionCardsState();
}

class _SubscriptionCardsState extends State<SubscriptionCards> {
  int selectedPlan = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Choose Your Plan",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 18),

        _planCard(
          index: 0,
          title: "MONTHLY",
          subtitle: "Perfect for beginners",
          badge: "",
        ),

        const SizedBox(height: 14),

        _planCard(
          index: 1,
          title: "YEARLY",
          subtitle: "Save up to 35%",
          badge: "BEST VALUE",
        ),
      ],
    );
  }

  Widget _planCard({
    required int index,
    required String title,
    required String subtitle,
    required String badge,
  }) {
    final selected = selectedPlan == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPlan = index;
        });
      },
      child: AnimatedScale(
        scale: selected ? 1.03 : 1.0,
        duration: const Duration(milliseconds: 250),
        child: GlassCard(
          premium: selected,
          padding: const EdgeInsets.all(18),
          borderColor: selected ? AppColors.gold : Colors.white24,
          boxShadow: selected ? AppShadows.premium : AppShadows.glow,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              if (badge.isNotEmpty)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.gold,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    badge,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}