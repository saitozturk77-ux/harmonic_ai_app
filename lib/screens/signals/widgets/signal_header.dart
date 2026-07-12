import 'dart:async';

import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';

class SignalHeader extends StatefulWidget {
  const SignalHeader({super.key});

  @override
  State<SignalHeader> createState() => _SignalHeaderState();
}

class _SignalHeaderState extends State<SignalHeader> {
  bool _pulse = true;

  int _signals = 24;

  Timer? _pulseTimer;
  Timer? _signalTimer;

  @override
  void initState() {
    super.initState();

    _pulseTimer = Timer.periodic(
      const Duration(milliseconds: 700),
      (_) {
        if (!mounted) return;

        setState(() {
          _pulse = !_pulse;
        });
      },
    );

    _signalTimer = Timer.periodic(
      const Duration(seconds: 8),
      (_) {
        if (!mounted) return;

        setState(() {
          _signals++;

          if (_signals > 40) {
            _signals = 24;
          }
        });
      },
    );
  }

  @override
  void dispose() {
    _pulseTimer?.cancel();
    _signalTimer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 10),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "AI SIGNALS",
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1,
                  ),
                ),

                const SizedBox(height: 6),

                const Text(
                  "Professional AI Trading Signals",
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 13,
                  ),
                ),

                const SizedBox(height: 10),

                Row(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: _pulse ? 10 : 7,
                      height: _pulse ? 10 : 7,
                      decoration: BoxDecoration(
                        color: AppColors.success,
                        shape: BoxShape.circle,
                        boxShadow: [
                          if (_pulse)
                            BoxShadow(
                              color:
                                  AppColors.success.withOpacity(.70),
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 8),

                    const Text(
                      "LIVE",
                      style: TextStyle(
                        color: AppColors.success,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Container(
            width: 92,
            height: 92,
            decoration: BoxDecoration(
              gradient: AppColors.cardGradient,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: AppColors.border,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "$_signals",
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                const Text(
                  "ACTIVE",
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 11,
                    letterSpacing: 1,
                  ),
                ),

                const Text(
                  "SIGNALS",
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 11,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}