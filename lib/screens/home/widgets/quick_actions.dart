import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const Text(
          "QUICK ACTIONS",
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),

        const SizedBox(height: 18),

        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1.35,
          children: const [

            _QuickCard(
              title: "AI Scanner",
              subtitle: "34 Markets",
              icon: Icons.radar_rounded,
              color: AppColors.ai,
            ),

            _QuickCard(
              title: "Trends",
              subtitle: "18 Bullish",
              icon: Icons.trending_up_rounded,
              color: AppColors.success,
            ),

            _QuickCard(
              title: "Harmonic",
              subtitle: "3 Patterns",
              icon: Icons.polyline_rounded,
              color: AppColors.primary,
            ),

            _QuickCard(
              title: "Candlestick",
              subtitle: "5 Signals",
              icon: Icons.candlestick_chart,
              color: AppColors.warning,
            ),

            _QuickCard(
              title: "Events",
              subtitle: "2 High Impact",
              icon: Icons.event_note_rounded,
              color: AppColors.danger,
            ),

            _QuickCard(
              title: "Risk Calc",
              subtitle: "Position Size",
              icon: Icons.calculate_rounded,
              color: AppColors.primary,
            ),

            _QuickCard(
              title: "Heat Map",
              subtitle: "Currencies",
              icon: Icons.grid_view_rounded,
              color: AppColors.success,
            ),

            _QuickCard(
              title: "Premium",
              subtitle: "Unlock AI",
              icon: Icons.workspace_premium_rounded,
              color: AppColors.premium,
            ),
          ],
        ),
      ],
    );
  }
}

class _QuickCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;

  const _QuickCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {},

      child: Container(
        padding: const EdgeInsets.all(18),

        decoration: BoxDecoration(
          gradient: AppColors.cardGradient,
          borderRadius: BorderRadius.circular(20),

          border: Border.all(
            color: AppColors.border,
          ),

          boxShadow: [
            BoxShadow(
              color: color.withOpacity(.12),
              blurRadius: 16,
              spreadRadius: 1,
            ),
          ],
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              width: 46,
              height: 46,

              decoration: BoxDecoration(
                color: color.withOpacity(.12),
                borderRadius: BorderRadius.circular(14),
              ),

              child: Icon(
                icon,
                color: color,
                size: 26,
              ),
            ),

            const Spacer(),

            Text(
              title,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              subtitle,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}