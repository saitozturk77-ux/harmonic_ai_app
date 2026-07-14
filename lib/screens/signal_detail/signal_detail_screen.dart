import 'widgets/trade_levels_detail_card.dart';
import 'package:flutter/material.dart';

import '../../core/models/signal_view_model.dart';
import '../../theme/app_colors.dart';
import 'widgets/detail_header.dart';
import 'widgets/ai_confidence_card.dart';
import 'widgets/ai_analysis_card.dart';
import 'widgets/ai_summary_card.dart';
import 'widgets/market_status_card.dart';
import 'widgets/alert_card.dart';
import 'widgets/favorite_share_card.dart';

class SignalDetailScreen extends StatelessWidget {
  const SignalDetailScreen({
    super.key,
    required this.viewModel,
  });

  final SignalViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final signal = viewModel.signal;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: false,
        title: Text(
          signal.pair,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [

            //--------------------------------------------------
            // HEADER
            //--------------------------------------------------

            DetailHeader(
              viewModel: viewModel,
            ),

            const SizedBox(height: 16),

            //--------------------------------------------------
            // TRADE LEVELS
            //--------------------------------------------------

            // TradeLevelsCard(
            //   viewModel: viewModel,
            // ),

            TradeLevelsDetailCard(
              viewModel: viewModel,
            ),

            const SizedBox(height: 16),

            //--------------------------------------------------
            // AI CONFIDENCE
            //--------------------------------------------------

            AIConfidenceCard(
              viewModel: viewModel,
            ),

            const SizedBox(height: 16),

            //--------------------------------------------------
            // AI ANALYSIS
            //--------------------------------------------------

            AIAnalysisCard(
              viewModel: viewModel,
            ),

            const SizedBox(height: 16),

            //--------------------------------------------------
            // AI SUMMARY
            //--------------------------------------------------

            const AISummaryCard(),

            const SizedBox(height: 16),

            //--------------------------------------------------
            // ALERT
            //--------------------------------------------------

            AlertCard(
              items: const [
                "Entry Trigger",
                "TP1 Hit",
                "TP2 Hit",
                "TP3 Hit",
                "Stop Loss Hit",
                "Signal Completed",
                "Trend Reversal",
              ],
            ),

            const SizedBox(height: 16),

            //--------------------------------------------------
            // FAVORITE & SHARE
            //--------------------------------------------------

            FavoriteShareCard(
              isFavorite: false,
              onFavorite: () {},
              onShare: () {},
            ),

            const SizedBox(height: 16),

            //--------------------------------------------------
            // MARKET STATUS
            //--------------------------------------------------

            const MarketStatusCard(),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}