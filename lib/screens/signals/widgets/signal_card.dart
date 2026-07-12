import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../core/models/signal_view_model.dart';
import '../../../theme/app_colors.dart';

class SignalCard extends StatelessWidget {
  const SignalCard({
    super.key,
    required this.viewModel,
  });

  final SignalViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final signal = viewModel.signal;

    final signalType = signal.signal.name.toUpperCase();

    final Color signalColor;

    switch (signalType) {
      case "BUY":
        signalColor = AppColors.buy;
        break;

      case "SELL":
        signalColor = AppColors.sell;
        break;

      default:
        signalColor = Colors.orange;
    }

    return Stack(
      children: [

        //--------------------------------------------------
        // MAIN CARD
        //--------------------------------------------------

        ClipRRect(
          borderRadius: BorderRadius.circular(22),

          child: ImageFiltered(
            imageFilter: ImageFilter.blur(
              sigmaX: viewModel.blur ? 2 : 0,
              sigmaY: viewModel.blur ? 2 : 0,
            ),

            child: Container(
              margin: const EdgeInsets.only(bottom: 18),

              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                gradient: AppColors.cardGradient,

                borderRadius: BorderRadius.circular(22),

                border: Border.all(
                  color: AppColors.border,
                ),

                boxShadow: [
                  BoxShadow(
                    color: signalColor.withOpacity(.08),
                    blurRadius: 18,
                    spreadRadius: 1,
                  ),
                ],
              ),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  //--------------------------------------------------
                  // HEADER
                  //--------------------------------------------------

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
                                color: AppColors.textPrimary,
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                              ),
                            ),

                            const SizedBox(height: 4),

                            Text(
                              signal.timeframe,

                              style: const TextStyle(
                                color: AppColors.textSecondary,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 10,
                        ),

                        decoration: BoxDecoration(
                          color:
                              signalColor.withOpacity(.15),

                          borderRadius:
                              BorderRadius.circular(30),
                        ),

                        child: Text(
                          signalType,

                          style: TextStyle(
                            color: signalColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            letterSpacing: .5,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),
                                    //--------------------------------------------------
                  // AI CONFIDENCE
                  //--------------------------------------------------

                  Container(
                    padding: const EdgeInsets.all(18),

                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.03),
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: Colors.white12,
                      ),
                    ),

                    child: Column(
                      children: [

                        Row(
                          children: [

                            const Icon(
                              Icons.psychology_alt_rounded,
                              color: AppColors.ai,
                              size: 26,
                            ),

                            const SizedBox(width: 10),

                            const Expanded(
                              child: Text(
                                "AI CONFIDENCE",
                                style: TextStyle(
                                  color: AppColors.textSecondary,
                                  fontSize: 13,
                                  letterSpacing: 1.2,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),

                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),

                              decoration: BoxDecoration(
                                color: signalColor.withOpacity(.12),
                                borderRadius:
                                    BorderRadius.circular(20),
                              ),

                              child: Text(
                                "${signal.confidence.toStringAsFixed(1)}%",
                                style: TextStyle(
                                  color: signalColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(20),

                          child: LinearProgressIndicator(
                            value: signal.confidence / 100,

                            minHeight: 10,

                            backgroundColor:
                                Colors.white10,

                            valueColor:
                                AlwaysStoppedAnimation(
                              signalColor,
                            ),
                          ),
                        ),

                        const SizedBox(height: 14),

                        Row(
                          children: [

                            const Icon(
                              Icons.auto_awesome,
                              size: 18,
                              color: AppColors.ai,
                            ),

                            const SizedBox(width: 6),

                            const Text(
                              "Neural AI Analysis",
                              style: TextStyle(
                                color:
                                    AppColors.textSecondary,
                                fontSize: 12,
                              ),
                            ),

                            const Spacer(),

                            Text(
                              signal.engine,
                              style: const TextStyle(
                                color: AppColors.ai,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  //--------------------------------------------------
                  // TRADE LEVELS
                  //--------------------------------------------------

                  Row(
                    children: [

                      Expanded(
                        child: _ValueBox(
                          title: "ENTRY",
                          value: formatPrice(
                            signal.pair,
                            signal.entry,
                          ),
                          color: AppColors.primary,
                        ),
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: _ValueBox(
                          title: "TAKE PROFIT",
                          value: formatPrice(
                            signal.pair,
                            signal.takeProfit,
                          ),
                          color: AppColors.success,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 14),

                  Row(
                    children: [

                      Expanded(
                        child: _ValueBox(
                          title: "STOP LOSS",
                          value: formatPrice(
                            signal.pair,
                            signal.stopLoss,
                          ),
                          color: AppColors.danger,
                        ),
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: _ValueBox(
                          title: "RISK / REWARD",
                          value: signal.riskReward
                              .toStringAsFixed(2),
                          color: AppColors.warning,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),
                                    //--------------------------------------------------
                  // ENGINE & STATUS
                  //--------------------------------------------------

                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.ai.withOpacity(.10),
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: AppColors.ai.withOpacity(.25),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.memory_rounded,
                              color: AppColors.ai,
                              size: 16,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              signal.engine,
                              style: const TextStyle(
                                color: AppColors.ai,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const Spacer(),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.success.withOpacity(.12),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
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
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 22),

                  //--------------------------------------------------
                  // AI CONFIRMATIONS
                  //--------------------------------------------------

                  const Text(
                    "AI CONFIRMATIONS",
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: signal.confirmations
                        .map(
                          (item) => _ConfirmationChip(
                            text: item.name.toUpperCase(),
                          ),
                        )
                        .toList(),
                  ),

                  const SizedBox(height: 24),

                  //--------------------------------------------------
                  // UPDATED
                  //--------------------------------------------------

                  Row(
                    children: const [
                      Icon(
                        Icons.schedule,
                        size: 16,
                        color: AppColors.textSecondary,
                      ),
                      SizedBox(width: 6),
                      Text(
                        "Updated just now",
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                                  ],
              ),
            ),
          ),
        ),

        //--------------------------------------------------
        // PREMIUM OVERLAY
        //--------------------------------------------------

        if (viewModel.locked)
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(.55),
                borderRadius: BorderRadius.circular(22),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      const Icon(
                        Icons.workspace_premium_rounded,
                        color: Color(0xFFFFC107),
                        size: 60,
                      ),

                      const SizedBox(height: 16),

                      const Text(
                        "UNLOCK PREMIUM",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        "${signal.pair} signal is available only for Premium members.",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white70,
                          height: 1.4,
                        ),
                      ),

                      const SizedBox(height: 24),

                      const _PremiumItem("Live AI Signals"),
                      SizedBox(height: 8),
                      const _PremiumItem("Unlimited Alerts"),
                      SizedBox(height: 8),
                      const _PremiumItem("35+ Trading Pairs"),
                      SizedBox(height: 8),
                      const _PremiumItem("Gold, Crypto & Indices"),
                      SizedBox(height: 8),
                      const _PremiumItem("Harmonic AI"),

                      const SizedBox(height: 28),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(52),
                          ),
                          onPressed: () {
                            // TODO Premium Screen
                          },
                          icon: const Icon(Icons.workspace_premium),
                          label: const Text(
                            "Upgrade to Premium",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

String formatPrice(String pair, double value) {
  if (pair.contains('XAU')) {
    return value.toStringAsFixed(2);
  }

  if (pair.contains('XAG')) {
    return value.toStringAsFixed(3);
  }

  if (pair.contains('BTC') || pair.contains('ETH')) {
    return value.toStringAsFixed(2);
  }

  if (pair.contains('NAS') ||
      pair.contains('US30') ||
      pair.contains('GER')) {
    return value.toStringAsFixed(0);
  }

  return value.toStringAsFixed(5);
}

class _ValueBox extends StatelessWidget {
  const _ValueBox({
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
      padding: const EdgeInsets.all(14),
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

class _ConfirmationChip extends StatelessWidget {
  const _ConfirmationChip({
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: AppColors.success.withOpacity(.10),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.success.withOpacity(.30),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.check_circle,
            color: AppColors.success,
            size: 14,
          ),
          const SizedBox(width: 5),
          Text(
            text,
            style: const TextStyle(
              color: AppColors.success,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _PremiumItem extends StatelessWidget {
  const _PremiumItem(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.check_circle,
          color: Color(0xFF63FF7A),
          size: 18,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}