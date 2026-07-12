import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';

enum MembershipType {
  free,
  trial,
  premium,
}

class TrialCard extends StatelessWidget {
  const TrialCard({
    super.key,
    this.membership = MembershipType.trial,
    this.daysLeft = 10,
  });

  final MembershipType membership;
  final int daysLeft;

  @override
  Widget build(BuildContext context) {
    switch (membership) {
      case MembershipType.free:
        return _freeCard();

      case MembershipType.trial:
        return _trialCard();

      case MembershipType.premium:
        return _premiumCard();
    }
  }

  //------------------------------------------------------------

  Widget _trialCard() {
    final progress = (daysLeft / 10).clamp(0.0, 1.0);

    return Container(
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        gradient: AppColors.premiumGradient,
        borderRadius: BorderRadius.circular(22),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Row(
            children: [

              Icon(
                Icons.workspace_premium,
                color: Colors.black87,
                size: 30,
              ),

              SizedBox(width: 10),

              Text(
                "PREMIUM TRIAL",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          Text(
            "$daysLeft Days Remaining",
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),

          const SizedBox(height: 12),

          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 8,
              backgroundColor: Colors.black12,
              valueColor: const AlwaysStoppedAnimation(
                Colors.black87,
              ),
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            "Your Trial Includes",
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 12),

          const Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [

              _FeatureChip("AI Scanner"),
              _FeatureChip("Gold Signals"),
              _FeatureChip("Crypto"),
              _FeatureChip("Harmonic"),
              _FeatureChip("Candlestick AI"),
              _FeatureChip("Unlimited Alerts"),
            ],
          ),

          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black87,
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(48),
              ),
              onPressed: () {},
              icon: const Icon(Icons.bolt),
              label: const Text(
                "Upgrade to Premium",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //------------------------------------------------------------

  Widget _freeCard() {
    return _simpleCard(
      title: "FREE PLAN",
      subtitle: "Unlock AI Scanner and Premium Signals",
      icon: Icons.lock_open,
      color: AppColors.primary,
    );
  }

  //------------------------------------------------------------

  Widget _premiumCard() {
    return _simpleCard(
      title: "PREMIUM ACTIVE",
      subtitle: "All Features Enabled",
      icon: Icons.verified,
      color: AppColors.success,
    );
  }

  //------------------------------------------------------------

  Widget _simpleCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: AppColors.cardGradient,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [

          Icon(icon, color: color, size: 36),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  title,
                  style: TextStyle(
                    color: color,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  subtitle,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureChip extends StatelessWidget {
  final String text;

  const _FeatureChip(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF0C2D27),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xFF1C5A4E),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.check_circle,
            color: Color(0xFF5CFF88),
            size: 18,
          ),
          const SizedBox(width: 6),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}