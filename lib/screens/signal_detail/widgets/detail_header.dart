import 'package:flutter/material.dart';

import '../../../core/models/signal_view_model.dart';
import '../../../theme/app_colors.dart';
import '../../../core/favorites/favorite_manager.dart';

class DetailHeader extends StatelessWidget {
  const DetailHeader({
    super.key,
    required this.viewModel,
  });

  final SignalViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final signal = viewModel.signal;

    final signalType = signal.signal.name.toUpperCase();

    Color badgeColor;

    switch (signalType) {
      case "BUY":
        badgeColor = AppColors.buy;
        break;
      case "SELL":
        badgeColor = AppColors.sell;
        break;
      default:
        badgeColor = Colors.orange;
    }

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

          //----------------------------------------
          // TOP ROW
          //----------------------------------------

          Row(
            children: [

              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [

                    Text(
                      signal.pair,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: AppColors.textPrimary,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      signal.timeframe,
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),

              Icon(
                FavoriteManager.isFavorite(signal.signalId)
                    ? Icons.star
                    : Icons.star_border,
                color: Colors.orange,
              )
            ],
          ),

          const SizedBox(height: 18),

          //----------------------------------------
          // BUY SELL
          //----------------------------------------

          Row(
            children: [

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: badgeColor.withOpacity(.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  signalType,
                  style: TextStyle(
                    color: badgeColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),

              const SizedBox(width: 12),

              Text(
                "${signal.confidence.toStringAsFixed(1)} %",
                style: const TextStyle(
                  color: AppColors.ai,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),

              const Spacer(),

              const Icon(
                Icons.schedule,
                size: 16,
                color: AppColors.textSecondary,
              ),

              const SizedBox(width: 6),

              const Text(
                "Updated now",
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}