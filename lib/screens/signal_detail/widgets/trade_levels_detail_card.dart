import 'package:flutter/material.dart';

import '../../../core/models/signal_view_model.dart';
import '../../../theme/app_colors.dart';

class TradeLevelsDetailCard extends StatelessWidget {
  const TradeLevelsDetailCard({
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

          const SizedBox(height: 20),

          _ValueRow(
            title: "ENTRY",
            value: _formatPrice(
              signal.pair,
              signal.entry,
            ),
            color: AppColors.primary,
          ),

          const SizedBox(height: 12),

          _ValueRow(
            title: "STOP LOSS",
            value: _formatPrice(
              signal.pair,
              signal.stopLoss,
            ),
            color: AppColors.danger,
          ),

          const SizedBox(height: 20),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: AppColors.border,
              height: 1,
            ),
          ),

          const SizedBox(height: 20),

          _TargetRow(
            title: "TP1",
            value: _formatPrice(
              signal.pair,
              signal.takeProfit,
            ),
            hit: signal.tp1Hit,
          ),

          const SizedBox(height: 10),

          _TargetRow(
            title: "TP2",
            value: _formatPrice(
              signal.pair,
              signal.tp2,
            ),
            hit: signal.tp2Hit,
          ),

          const SizedBox(height: 10),

          _TargetRow(
            title: "TP3",
            value: _formatPrice(
              signal.pair,
              signal.tp3,
            ),
            hit: signal.tp3Hit,
          ),

          const SizedBox(height: 20),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: AppColors.border,
              height: 1,
            ),
          ),

          const SizedBox(height: 20),

          _ValueRow(
            title: "RISK / REWARD",
            value: signal.rrText,
            color: AppColors.warning,
          ),

        ],
      ),
    );
  }
}
class _ValueRow extends StatelessWidget {
  const _ValueRow({
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
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 14,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.03),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
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
class _TargetRow extends StatelessWidget {
  const _TargetRow({
    required this.title,
    required this.value,
    required this.hit,
  });

  final String title;
  final String value;
  final bool hit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 14,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.03),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: AppColors.success,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
          const SizedBox(width: 14),
          Icon(
            hit
                ? Icons.check_circle
                : Icons.radio_button_unchecked,
            color: hit
                ? AppColors.success
                : AppColors.textSecondary,
            size: 22,
          ),
        ],
      ),
    );
  }
}
String _formatPrice(String pair, double value) {
  if (pair.contains("XAU")) {
    return value.toStringAsFixed(2);
  }

  if (pair.contains("XAG")) {
    return value.toStringAsFixed(3);
  }

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