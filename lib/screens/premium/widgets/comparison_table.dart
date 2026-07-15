import 'package:flutter/material.dart';

class ComparisonTable extends StatelessWidget {
  const ComparisonTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF111C28),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF00BCD4).withValues(alpha: 0.20),
        ),
      ),
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
                      color: Color(0xFFFFC107),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

            ],
          ),

          const SizedBox(height: 18),

          _row("EUR/USD", true, true),
          _row("27 Forex Pairs", false, true),
          _row("Gold (XAU/USD)", false, true),
          _row("Silver (XAG/USD)", false, true),
          _row("Crypto", false, true),
          _row("Economic Calendar", true, true),
          _row("Favorites", true, true),
          _row("Trend AI", false, true),
          _row("Candlestick AI", false, true),
          _row("Harmonic AI", false, true),
          _row("Unlimited Alerts", false, true),

        ],
      ),
    );
  }

  Widget _row(
    String feature,
    bool free,
    bool premium,
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

          Expanded(
            child: const Center(
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