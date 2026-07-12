import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../theme/app_colors.dart';

class AIHeader extends StatefulWidget {
  const AIHeader({super.key});

  @override
  State<AIHeader> createState() => _AIHeaderState();
}

class _AIHeaderState extends State<AIHeader> {
  final List<String> _markets = [
    "EURUSD",
    "GBPUSD",
    "USDJPY",
    "AUDUSD",
    "NZDUSD",
    "USDCAD",
    "USDCHF",
    "XAUUSD",
    "XAGUSD",
    "BTCUSD",
    "ETHUSD",
    "NAS100",
  ];

  int _currentIndex = 0;
  bool _onlinePulse = true;

  Timer? _pairTimer;
  Timer? _pulseTimer;

  @override
  void initState() {
    super.initState();

    _pairTimer = Timer.periodic(
      const Duration(seconds: 2),
      (_) {
        if (!mounted) return;

        setState(() {
          _currentIndex++;

          if (_currentIndex >= _markets.length) {
            _currentIndex = 0;
          }
        });
      },
    );

    _pulseTimer = Timer.periodic(
      const Duration(milliseconds: 700),
      (_) {
        if (!mounted) return;

        setState(() {
          _onlinePulse = !_onlinePulse;
        });
      },
    );
  }

  @override
  void dispose() {
    _pairTimer?.cancel();
    _pulseTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        //------------------------------------------------

        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: AppColors.ai.withOpacity(.15),
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Icon(
            Icons.psychology_alt_rounded,
            color: AppColors.ai,
            size: 28,
          ),
        ),

        const SizedBox(width: 14),

        //------------------------------------------------

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Text(
                "AI ENGINE",
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 4),

              const Text(
                "Neural Signal Processor",
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 12,
                ),
              ),

              const SizedBox(height: 8),

              AnimatedSwitcher(
                duration: const Duration(milliseconds: 350),

                child: Text(
                  "Scanning ${_markets[_currentIndex]}...",
                  key: ValueKey(_markets[_currentIndex]),

                  style: const TextStyle(
                    color: AppColors.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),

        //------------------------------------------------

        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 6,
              ),

              decoration: BoxDecoration(
                color: AppColors.success.withOpacity(.15),
                borderRadius: BorderRadius.circular(20),
              ),

              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [

                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),

                    width: _onlinePulse ? 10 : 7,
                    height: _onlinePulse ? 10 : 7,

                    decoration: BoxDecoration(
                      color: AppColors.success,
                      shape: BoxShape.circle,

                      boxShadow: [

                        if (_onlinePulse)
                          BoxShadow(
                            color: AppColors.success.withOpacity(.7),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 6),

                  const Text(
                    "ONLINE",
                    style: TextStyle(
                      color: AppColors.success,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "AI SCORE",
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 10,
              ),
            ),

            const Text(
              "A+",
              style: TextStyle(
                color: AppColors.success,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}