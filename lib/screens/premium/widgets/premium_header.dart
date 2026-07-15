import 'package:flutter/material.dart';

class PremiumHeader extends StatelessWidget {
  const PremiumHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Hero(
          tag: "premium_logo",
          child: Image.asset(
            "assets/images/logo.png",
            width: 90,
            height: 90,
          ),
        ),

        const SizedBox(height: 20),

        const Text(
          "FOREX MATRIX",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.4,
          ),
        ),

        const SizedBox(height: 6),

        const Text(
          "PREMIUM",
          style: TextStyle(
            color: Color(0xFFFFC107),
            fontSize: 28,
            fontWeight: FontWeight.bold,
            letterSpacing: 6,
          ),
        ),

        const SizedBox(height: 14),

        const Text(
          "Unlock the Full Power\nof AI Trading",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white70,
            fontSize: 17,
            height: 1.4,
          ),
        ),

        const SizedBox(height: 10),

        const Text(
          "Real-time AI signals\nAdvanced market analysis\nPremium trading tools",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white54,
            fontSize: 13,
            height: 1.6,
          ),
        ),

        const SizedBox(height: 30),
      ],
    );
  }
}