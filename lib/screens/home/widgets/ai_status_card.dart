import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';

import 'ai/ai_header.dart';
import 'ai/ai_confidence.dart';
import 'ai/ai_stats.dart';

class AIStatusCard extends StatelessWidget {
  const AIStatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: AppColors.cardGradient,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: AppColors.border,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryGlow.withOpacity(.12),
            blurRadius: 18,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
                    AIHeader(),

          SizedBox(height: 24),

          AIConfidence(),

          SizedBox(height: 24),

          AIStats(),

        ],
      ),
    );
  }
}