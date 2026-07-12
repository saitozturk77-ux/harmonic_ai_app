import 'package:flutter/material.dart';

import '../../../core/models/signal_view_model.dart';
import '../../../theme/app_colors.dart';

class AIConfidenceCard extends StatelessWidget {
  const AIConfidenceCard({
    super.key,
    required this.viewModel,
  });

  final SignalViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final signal = viewModel.signal;

    final double confidence =
    signal.confidence.clamp(0.0, 100.0).toDouble();

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

          const Text(
            "AI CONFIDENCE",
            style: TextStyle(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),

          const SizedBox(height: 18),

          Row(
            children: [

              Expanded(
                child: Text(
                  "${confidence.toStringAsFixed(1)}%",
                  style: const TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w900,
                    color: AppColors.ai,
                  ),
                ),
              ),

              _qualityStars(confidence),
            ],
          ),

          const SizedBox(height: 18),

          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              minHeight: 10,
              value: confidence / 100,
              backgroundColor: Colors.white10,
              valueColor: AlwaysStoppedAnimation(
                _confidenceColor(confidence),
              ),
            ),
          ),

          const SizedBox(height: 18),

          Row(
            children: [

              Expanded(
                child: _InfoTile(
                  "QUALITY",
                  _qualityText(confidence),
                ),
              ),

              Expanded(
                child: _InfoTile(
                  "RISK",
                  _riskText(confidence),
                ),
              ),

              Expanded(
                child: _InfoTile(
                  "PROBABILITY",
                  _probabilityText(confidence),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _qualityStars(double confidence) {
    int stars;

    if (confidence >= 95) {
      stars = 5;
    } else if (confidence >= 90) {
      stars = 4;
    } else if (confidence >= 80) {
      stars = 3;
    } else if (confidence >= 70) {
      stars = 2;
    } else {
      stars = 1;
    }

    return Row(
      children: List.generate(
        5,
        (index) => Icon(
          index < stars
              ? Icons.star
              : Icons.star_border,
          color: Colors.amber,
          size: 20,
        ),
      ),
    );
  }

  Color _confidenceColor(double value) {
    if (value >= 90) return Colors.greenAccent;
    if (value >= 75) return Colors.orange;
    return Colors.redAccent;
  }

  String _qualityText(double value) {
    if (value >= 95) return "EXCELLENT";
    if (value >= 90) return "VERY GOOD";
    if (value >= 80) return "GOOD";
    if (value >= 70) return "MEDIUM";
    return "LOW";
  }

  String _riskText(double value) {
    if (value >= 90) return "LOW";
    if (value >= 75) return "MEDIUM";
    return "HIGH";
  }

  String _probabilityText(double value) {
    if (value >= 95) return "VERY HIGH";
    if (value >= 90) return "HIGH";
    if (value >= 80) return "GOOD";
    return "NORMAL";
  }
}

class _InfoTile extends StatelessWidget {
  const _InfoTile(
    this.title,
    this.value,
  );

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Text(
          title,
          style: const TextStyle(
            fontSize: 11,
            color: AppColors.textSecondary,
          ),
        ),

        const SizedBox(height: 6),

        Text(
          value,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}