import 'package:flutter/material.dart';

class StatsGrid extends StatelessWidget {
  const StatsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Expanded(
              child: _StatCard(
                value: "97%",
                title: "AI Accuracy",
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _StatCard(
                value: "27",
                title: "Markets",
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        Row(
          children: const [
            Expanded(
              child: _StatCard(
                value: "4",
                title: "AI Engines",
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _StatCard(
                value: "24/7",
                title: "Updates",
              ),
            ),
          ],
        ),

        const SizedBox(height: 30),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String title;

  const _StatCard({
    required this.value,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        color: const Color(0xFF111C28),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFF00BCD4).withValues(alpha: 0.25),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF00BCD4).withValues(alpha: 0.10),
            blurRadius: 18,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}