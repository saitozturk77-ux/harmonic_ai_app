import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';

class MarketStatusCard extends StatelessWidget {
  const MarketStatusCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: AppColors.cardGradient,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Row(
            children: [

              Icon(
                Icons.public,
                color: Colors.greenAccent,
              ),

              SizedBox(width: 10),

              Text(
                "MARKET STATUS",
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          const _StatusRow(
            title: "Market",
            value: "OPEN",
            color: Colors.greenAccent,
          ),

          const _StatusRow(
            title: "Session",
            value: "London + New York",
            color: Colors.orangeAccent,
          ),

          const _StatusRow(
            title: "Signal",
            value: "ACTIVE",
            color: Colors.lightBlueAccent,
          ),

          const _StatusRow(
            title: "Last Analysis",
            value: "2 min ago",
            color: Colors.white,
          ),

          const _StatusRow(
            title: "Next Scan",
            value: "45 sec",
            color: Colors.amber,
          ),

          const _StatusRow(
            title: "AI Engine",
            value: "ONLINE",
            color: Colors.greenAccent,
          ),
        ],
      ),
    );
  }
}

class _StatusRow extends StatelessWidget {
  const _StatusRow({
    required this.title,
    required this.value,
    required this.color,
  });

  final String title;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [

          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: AppColors.textSecondary,
              ),
            ),
          ),

          Text(
            value,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}