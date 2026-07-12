import 'package:flutter/material.dart';

import '../../../core/models/signal_view_model.dart';
import '../../../theme/app_colors.dart';

class TradeLevelsCard extends StatelessWidget {
  const TradeLevelsCard({
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
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text(
            "TRADE LEVELS",
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
                child: _ValueCard(
                  title: "ENTRY",
                  value: _formatPrice(
                    signal.pair,
                    signal.entry,
                  ),
                  color: AppColors.primary,
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: _ValueCard(
                  title: "TAKE PROFIT",
                  value: _formatPrice(
                    signal.pair,
                    signal.takeProfit,
                  ),
                  color: AppColors.success,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            children: [

              Expanded(
                child: _ValueCard(
                  title: "STOP LOSS",
                  value: _formatPrice(
                    signal.pair,
                    signal.stopLoss,
                  ),
                  color: AppColors.danger,
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: _ValueCard(
                  title: "RISK / REWARD",
                  value: signal.riskReward.toStringAsFixed(2),
                  color: AppColors.warning,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static String _formatPrice(String pair, double value) {
    if (pair.contains("XAU")) return value.toStringAsFixed(2);

    if (pair.contains("XAG")) return value.toStringAsFixed(3);

    if (pair.contains("BTC") || pair.contains("ETH")) {
      return value.toStringAsFixed(2);
    }

    if (pair.contains("NAS") ||
        pair.contains("US30") ||
        pair.contains("GER")) {
      return value.toStringAsFixed(0);
    }

    return value.toStringAsFixed(5);
  }
}

class _ValueCard extends StatelessWidget {
  const _ValueCard({
    required this.title,
    required this.value,
    required this.color,
  });

  final String title;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.03),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            title,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 11,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            value,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}