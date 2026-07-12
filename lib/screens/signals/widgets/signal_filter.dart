import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/models/signal_model.dart';
import '../../../theme/app_colors.dart';

class SignalFilter extends StatefulWidget {
  const SignalFilter({
    super.key,
    required this.selectedCategory,
    required this.onCategoryChanged,
  });

  final MarketCategory? selectedCategory;
  final ValueChanged<MarketCategory?> onCategoryChanged;

  @override
  State<SignalFilter> createState() => _SignalFilterState();
}

class _SignalFilterState extends State<SignalFilter> {
  final ScrollController _scrollController = ScrollController();

  bool _animationPlayed = false;

  final List<_FilterItem> filters = const [
    _FilterItem("All", Icons.apps_rounded, null),
    _FilterItem("Forex", Icons.currency_exchange, MarketCategory.forex),
    _FilterItem("Metals", Icons.workspace_premium, MarketCategory.metals),
    _FilterItem("Crypto", Icons.currency_bitcoin, MarketCategory.crypto),
    _FilterItem("Indices", Icons.show_chart, MarketCategory.indices),
  ];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (_animationPlayed) return;

      _animationPlayed = true;

      await Future.delayed(const Duration(milliseconds: 450));

      if (!_scrollController.hasClients) return;

      await _scrollController.animateTo(
        28,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOut,
      );

      await _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Stack(
        children: [
          ListView.separated(
            controller: _scrollController,
            padding: const EdgeInsets.symmetric(horizontal: 18),
            scrollDirection: Axis.horizontal,
            itemCount: filters.length,
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              final item = filters[index];
              final selected =
                  widget.selectedCategory == item.category;

              return AnimatedScale(
                duration: const Duration(milliseconds: 180),
                scale: selected ? 1.04 : 1.0,
                child: GestureDetector(
                  onTap: () {
                    HapticFeedback.selectionClick();
                    widget.onCategoryChanged(item.category);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeOut,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      gradient: selected
                          ? const LinearGradient(
                              colors: [
                                AppColors.primary,
                                AppColors.ai,
                              ],
                            )
                          : AppColors.cardGradient,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: selected
                            ? AppColors.primary
                            : AppColors.border,
                      ),
                      boxShadow: selected
                          ? [
                              BoxShadow(
                                color: AppColors.primaryGlow
                                    .withOpacity(.35),
                                blurRadius: 16,
                                spreadRadius: 1,
                              ),
                            ]
                          : [],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          item.icon,
                          size: 16,
                          color: selected
                              ? Colors.white
                              : AppColors.textSecondary,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          item.title,
                          style: TextStyle(
                            color: selected
                                ? Colors.white
                                : AppColors.textPrimary,
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),

          IgnorePointer(
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 28,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.transparent,
                      AppColors.background,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterItem {
  final String title;
  final IconData icon;
  final MarketCategory? category;

  const _FilterItem(
    this.title,
    this.icon,
    this.category,
  );
}