import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';

class BottomNavigation extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          gradient: AppColors.cardGradient,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: AppColors.border,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryGlow.withOpacity(.10),
              blurRadius: 20,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          children: [

            _item(
              index: 0,
              icon: Icons.home_rounded,
              label: "Home",
            ),

            _item(
              index: 1,
              icon: Icons.show_chart_rounded,
              label: "Signals",
            ),

            _item(
              index: 2,
              icon: Icons.radar_rounded,
              label: "Scanner",
            ),

            _item(
              index: 3,
              icon: Icons.psychology_alt_rounded,
              label: "AI",
            ),

            _item(
              index: 4,
              icon: Icons.settings_rounded,
              label: "Settings",
            ),
          ],
        ),
      ),
    );
  }

  //-------------------------------------------------------

  Widget _item({
    required int index,
    required IconData icon,
    required String label,
  }) {
    final selected = currentIndex == index;

    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () => onTap(index),

        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),

          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),

          decoration: BoxDecoration(
            color: selected
                ? AppColors.primary.withOpacity(.12)
                : Colors.transparent,

            borderRadius: BorderRadius.circular(16),
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              Icon(
                icon,
                color: selected
                    ? AppColors.primary
                    : AppColors.textMuted,
                size: 24,
              ),

              const SizedBox(height: 6),

              Text(
                label,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: selected
                      ? AppColors.primary
                      : AppColors.textMuted,
                ),
              ),

              const SizedBox(height: 6),

              AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                width: selected ? 24 : 0,
                height: 3,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}