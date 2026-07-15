import '../../core/favorites/favorite_manager.dart';
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

class SignalDetailScreen extends StatefulWidget {
  const SignalDetailScreen({
    super.key,
    required this.viewModel,
  });

  final SignalViewModel viewModel;

 @override
 State<SignalDetailScreen> createState() =>
     _SignalDetailScreenState();
 }

 class _SignalDetailScreenState
     extends State<SignalDetailScreen> {

  @override
  Widget build(BuildContext context) {
    final signal = widget.viewModel.signal;

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
              viewModel: widget.viewModel,
            ),

            const SizedBox(height: 16),

            //--------------------------------------------------
            // TRADE LEVELS
            //--------------------------------------------------

            // TradeLevelsCard(
            //   viewModel: widget.viewModel,
            // ),

            TradeLevelsDetailCard(
              viewModel: widget.viewModel,
            ),

            const SizedBox(height: 16),

            //--------------------------------------------------
            // AI CONFIDENCE
            //--------------------------------------------------

            AIConfidenceCard(
              viewModel: widget.viewModel,
            ),

            const SizedBox(height: 16),

            //--------------------------------------------------
            // AI ANALYSIS
            //--------------------------------------------------

            AIAnalysisCard(
              viewModel: widget.viewModel,
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
              isFavorite: FavoriteManager.isFavorite(signal.signalId),
              onFavorite: () {
                final newState = FavoriteManager.toggle(signal.signalId);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      newState
                          ? "⭐ Added to Favorites"
                          : "☆ Removed from Favorites",
                    ),
                  ),
                );

                setState(() {});
              },
              onShare: () {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Row(
          children: const [
            Icon(
              Icons.lock,
              color: Colors.amber,
            ),
            SizedBox(width: 8),
            Text("Premium Feature"),
          ],
        ),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Signal sharing is available only for Premium members.",
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.check_circle,
                    color: Colors.green, size: 18),
                SizedBox(width: 8),
                Text("Unlimited AI Signals"),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.check_circle,
                    color: Colors.green, size: 18),
                SizedBox(width: 8),
                Text("Share Trading Signals"),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.check_circle,
                    color: Colors.green, size: 18),
                SizedBox(width: 8),
                Text("Advanced AI Engines"),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.check_circle,
                    color: Colors.green, size: 18),
                SizedBox(width: 8),
                Text("Instant Notifications"),
              ],
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Maybe Later"),
          ),
          FilledButton.icon(
            onPressed: () {
              Navigator.pop(context);

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    "Premium subscription page will be available soon.",
                  ),
                ),
              );
            },
            icon: const Icon(Icons.workspace_premium),
            label: const Text("Upgrade"),
          ),
        ],
      );
    },
  );
},
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