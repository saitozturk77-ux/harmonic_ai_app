import 'package:flutter/material.dart';

import 'widgets/premium_header.dart';
import 'widgets/stats_grid.dart';
import 'widgets/comparison_table.dart';
import 'widgets/subscription_cards.dart';
import 'widgets/premium_button.dart';

class PremiumScreen extends StatelessWidget {
  const PremiumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF050B12),
      appBar: AppBar(
        backgroundColor: const Color(0xFF050B12),
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text("Forex Matrix Premium"),
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              PremiumHeader(),
              StatsGrid(),
              ComparisonTable(),
              SizedBox(height: 28),
              SubscriptionCards(),
              SizedBox(height: 28),
              PremiumButton(),
            ],
          ),
        ),
      ),
    );
  }
}