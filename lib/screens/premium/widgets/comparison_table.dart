import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/glass_card.dart';

class ComparisonTable extends StatelessWidget {
  const ComparisonTable({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        children: [
          const Row(
            children: [
              Expanded(
                flex: 4,
                child: Text(
                  "FEATURE",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    "FREE",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    "PRO",
                    style: TextStyle(
                      color: AppColors.gold,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          _row("EUR/USD", true),
          _row("27 Forex Pairs", false),
          _row("Gold (XAU/USD)", false),
          _row("Silver (XAG/USD)", false),
          _row("Crypto", false),
          _row("Economic Calendar", true),
          _row("Favorites", true),
          _row("Trend AI", false),
          _row("Candlestick AI", false),
          _row("Harmonic AI", false),
          _row("Unlimited Alerts", false),
        ],
      ),
    );
  }

  static Widget _row(
    String feature,
    bool free,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Text(
              feature,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Icon(
                free ? Icons.check_circle : Icons.cancel,
                color: free ? Colors.green : Colors.redAccent,
                size: 20,
              ),
            ),
          ),
          const Expanded(
            child: Center(
              child: Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}