import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import '../../../../theme/app_colors.dart';

class AIConfidence extends StatefulWidget {
  const AIConfidence({super.key});

  @override
  State<AIConfidence> createState() => _AIConfidenceState();
}

class _AIConfidenceState extends State<AIConfidence> {

  double _confidence = 96.8;

  final Random _random = Random();

  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(
      const Duration(seconds: 2),
      (_) {

        if (!mounted) return;

        setState(() {

          final delta =
              (_random.nextDouble() * 0.6) - 0.3;

          _confidence = 96.8 + delta;

        });

      },
    );
  }

  @override
  void dispose() {

    _timer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const Text(
          "AI Confidence",
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 13,
          ),
        ),

        const SizedBox(height: 8),

        AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),

          child: Text(
            "${_confidence.toStringAsFixed(1)}%",

            key: ValueKey(
              _confidence.toStringAsFixed(1),
            ),

            style: const TextStyle(
              color: AppColors.primary,
              fontSize: 42,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),

        const SizedBox(height: 16),

        TweenAnimationBuilder<double>(
          duration:
              const Duration(milliseconds: 700),

          tween: Tween(
            begin: 0,
            end: _confidence / 100,
          ),

          builder: (
            context,
            value,
            child,
          ) {

            return LinearProgressIndicator(

              value: value,

              minHeight: 6,

              borderRadius:
                  BorderRadius.circular(10),

              backgroundColor: Colors.white10,

              valueColor:
                  const AlwaysStoppedAnimation(
                AppColors.success,
              ),
            );
          },
        ),
      ],
    );
  }
}