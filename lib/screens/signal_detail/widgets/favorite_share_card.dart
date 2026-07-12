import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';

class FavoriteShareCard extends StatelessWidget {
  const FavoriteShareCard({
    super.key,
    this.isFavorite = false,
    this.onFavorite,
    this.onShare,
  });

  final bool isFavorite;
  final VoidCallback? onFavorite;
  final VoidCallback? onShare;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: AppColors.cardGradient,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton.icon(
              onPressed: onFavorite,
              icon: Icon(
                isFavorite
                    ? Icons.star
                    : Icons.star_border,
                color: Colors.amber,
              ),
              label: Text(
                isFavorite
                    ? "Favorited"
                    : "Favorite",
              ),
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: ElevatedButton.icon(
              onPressed: onShare,
              icon: const Icon(Icons.share),
              label: const Text("Share"),
            ),
          ),
        ],
      ),
    );
  }
}