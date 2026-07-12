import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';

class LatestSignals extends StatelessWidget {
  const LatestSignals({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        //------------------------------------------------

        Row(
          children: [

            const Text(
              "LATEST AI SIGNALS",
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),

            const Spacer(),

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 4,
              ),

              decoration: BoxDecoration(
                color: AppColors.success.withOpacity(.15),
                borderRadius: BorderRadius.circular(20),
              ),

              child: const Row(
                children: [

                  Icon(
                    Icons.circle,
                    size: 10,
                    color: AppColors.success,
                  ),

                  SizedBox(width: 6),

                  Text(
                    "LIVE",
                    style: TextStyle(
                      color: AppColors.success,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 18),

        //------------------------------------------------

        const SignalTile(
          pair: "EURUSD",
          signal: "BUY",
          confidence: 96,
          timeframe: "15M",
        ),

        const SizedBox(height: 14),

        const SignalTile(
          pair: "XAUUSD",
          signal: "SELL",
          confidence: 94,
          timeframe: "5M",
        ),

        const SizedBox(height: 14),

        const SignalTile(
          pair: "GBPUSD",
          signal: "BUY",
          confidence: 91,
          timeframe: "30M",
        ),

        const SizedBox(height: 18),

        Align(
          alignment: Alignment.centerRight,

          child: TextButton.icon(
            onPressed: () {},

            icon: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: AppColors.primary,
            ),

            label: const Text(
              "View All Signals",
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SignalTile extends StatelessWidget {
  final String pair;
  final String signal;
  final int confidence;
  final String timeframe;

  const SignalTile({
    super.key,
    required this.pair,
    required this.signal,
    required this.confidence,
    required this.timeframe,
  });

  @override
  Widget build(BuildContext context) {

    final bool buy = signal == "BUY";

    return Container(
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        gradient: AppColors.cardGradient,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: AppColors.border,
        ),
      ),

      child: Row(
        children: [

          //------------------------------------------------

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                Text(
                  pair,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  timeframe,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),

          //------------------------------------------------

          Column(
            children: [

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 7,
                ),

                decoration: BoxDecoration(
                  color: buy
                      ? AppColors.buy.withOpacity(.15)
                      : AppColors.sell.withOpacity(.15),

                  borderRadius:
                      BorderRadius.circular(20),
                ),

                child: Text(
                  signal,
                  style: TextStyle(
                    color: buy
                        ? AppColors.buy
                        : AppColors.sell,

                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              Text(
                "$confidence%",
                style: const TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}