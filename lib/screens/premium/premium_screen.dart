import 'package:flutter/material.dart';

import '../../core/theme/app_gradients.dart';
import 'widgets/comparison_table.dart';
import 'widgets/premium_button.dart';
import 'widgets/premium_header.dart';
import 'widgets/stats_grid.dart';
import 'widgets/subscription_cards.dart';

class PremiumScreen extends StatelessWidget {
  const PremiumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        foregroundColor: Colors.white,
        title: const Text(
          "Forex Matrix Premium",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 0.6,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppGradients.background,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                PremiumHeader(),

                SizedBox(height: 12),

                StatsGrid(),

                SizedBox(height: 28),

                ComparisonTable(),

                SizedBox(height: 32),

                SubscriptionCards(),

                SizedBox(height: 32),

                PremiumButton(),

                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}