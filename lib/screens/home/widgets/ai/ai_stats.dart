import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import '../../../../theme/app_colors.dart';

class AIStats extends StatefulWidget {
  const AIStats({super.key});

  @override
  State<AIStats> createState() => _AIStatsState();
}

class _AIStatsState extends State<AIStats> {

  final Random _random = Random();

  Timer? _timer;

  int _latency = 28;
  int _signals = 128;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(
      const Duration(seconds: 2),
      (_) {

        if (!mounted) return;

        setState(() {

          _latency = 24 + _random.nextInt(8);

          _signals++;

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

    return Row(
      children: [

        Expanded(
          child: _InfoTile(
            title: "Latency",
            value: "$_latency ms",
            icon: Icons.speed_rounded,
          ),
        ),

        Expanded(
          child: _InfoTile(
            title: "Signals",
            value: "$_signals",
            icon: Icons.bolt_rounded,
          ),
        ),

        const Expanded(
          child: _InfoTile(
            title: "Version",
            value: "v1.0",
            icon: Icons.memory_rounded,
          ),
        ),
      ],
    );
  }
}

class _InfoTile extends StatelessWidget {

  final String title;
  final String value;
  final IconData icon;

  const _InfoTile({
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [

        Icon(
          icon,
          color: AppColors.primary,
          size: 22,
        ),

        const SizedBox(height: 8),

        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),

          child: Text(
            value,
            key: ValueKey(value),

            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        const SizedBox(height: 4),

        Text(
          title,
          style: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}