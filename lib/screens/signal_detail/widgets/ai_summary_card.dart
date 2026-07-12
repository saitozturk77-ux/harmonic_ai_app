import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';

class AISummaryCard extends StatelessWidget {
  const AISummaryCard({
    super.key,
    this.summary,
  });

  final String? summary;

  @override
  Widget build(BuildContext context) {
    final text = summary ??
        "The current trend remains bullish. "
        "Momentum is increasing and higher timeframe confirms the move. "
        "Risk remains low while AI confidence is high. "
        "TP1 is expected within the next few candles.";

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: AppColors.cardGradient,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(
                Icons.psychology,
                color: AppColors.ai,
              ),
              SizedBox(width: 10),
              Text(
                "AI SUMMARY",
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          Text(
            text,
            style: const TextStyle(
              color: AppColors.textSecondary,
              height: 1.6,
              fontSize: 14,
            ),
          ),

          const SizedBox(height: 18),

          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.ai.withOpacity(.08),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: const [
                Icon(
                  Icons.auto_awesome,
                  color: AppColors.ai,
                  size: 18,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "Generated automatically by Harmonic AI Engine",
                    style: TextStyle(
                      color: AppColors.ai,
                      fontWeight: FontWeight.w600,
                    ),
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