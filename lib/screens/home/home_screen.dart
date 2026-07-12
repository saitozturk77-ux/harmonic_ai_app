import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

import 'widgets/app_header.dart';
import 'widgets/ai_status_card.dart';
import 'widgets/latest_signals.dart';
import 'widgets/quick_actions.dart';
import 'widgets/trial_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),

          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 20,
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [

              // Header
              AppHeader(),

              SizedBox(height: 24),

              // AI Status
              AIStatusCard(),

              SizedBox(height: 18),

              // Trial
              TrialCard(),

              SizedBox(height: 18),

              // Latest Signals
              LatestSignals(),

              SizedBox(height: 18),

              // Quick Actions
              QuickActions(),

              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}