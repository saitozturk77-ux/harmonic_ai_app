import 'package:flutter/material.dart';

import '../../../core/models/signal_view_model.dart';
import '../../../theme/app_colors.dart';

class AIAnalysisCard extends StatelessWidget {
  const AIAnalysisCard({
    super.key,
    required this.viewModel,
  });

  final SignalViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final signal = viewModel.signal;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: AppColors.cardGradient,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text(
            "AI ANALYSIS",
            style: TextStyle(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),

          const SizedBox(height: 18),

          _AnalysisRow(
            icon: Icons.trending_up,
            title: "Trend",
            value: signal.signal.name.toUpperCase() == "BUY"
                ? "Bullish"
                : "Bearish",
            color: signal.signal.name.toUpperCase() == "BUY"
                ? Colors.greenAccent
                : Colors.redAccent,
          ),

          _AnalysisRow(
            icon: Icons.speed,
            title: "Momentum",
            value: "Strong",
            color: Colors.cyanAccent,
          ),

          _AnalysisRow(
            icon: Icons.layers,
            title: "Higher Trend",
            value: signal.signal.name.toUpperCase() == "BUY"
                ? "Bullish"
                : "Bearish",
            color: Colors.orangeAccent,
          ),

          _AnalysisRow(
            icon: Icons.psychology,
            title: "AI Pattern",
            value: "Neural AI Confirmed",
            color: Colors.purpleAccent,
          ),

          _AnalysisRow(
            icon: Icons.support,
            title: "Support",
            value: "Confirmed",
            color: Colors.greenAccent,
          ),

          _AnalysisRow(
            icon: Icons.show_chart,
            title: "Resistance",
            value: "Near",
            color: Colors.amber,
          ),

          _AnalysisRow(
            icon: Icons.login,
            title: "Entry Idea",
            value: "Break Confirmation",
            color: Colors.lightBlueAccent,
          ),

          _AnalysisRow(
            icon: Icons.warning_amber_rounded,
            title: "Invalidation",
            value: "Below Stop Loss",
            color: Colors.redAccent,
          ),
        ],
      ),
    );
  }
}

class _AnalysisRow extends StatelessWidget {
  const _AnalysisRow({
    required this.icon,
    required this.title,
    required this.value,
    required this.color,
  });

  final IconData icon;
  final String title;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        children: [

          Icon(
            icon,
            color: color,
            size: 18,
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: AppColors.textSecondary,
              ),
            ),
          ),

          Text(
            value,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}