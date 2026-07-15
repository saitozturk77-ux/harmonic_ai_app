import 'package:flutter/material.dart';

import '../../core/models/signal_model.dart';
import '../../core/models/user_subscription.dart';
import '../../theme/app_colors.dart';

import 'widgets/signal_filter.dart';
import 'widgets/signal_header.dart';
import 'widgets/signal_list.dart';
import 'widgets/signal_search.dart';

class SignalsScreen extends StatefulWidget {
  const SignalsScreen({super.key});

  @override
  State<SignalsScreen> createState() => _SignalsScreenState();
}

class _SignalsScreenState extends State<SignalsScreen> {
  String _searchText = '';

  bool _favoritesOnly = false;

  MarketCategory? _selectedCategory;

  void _onSearchChanged(String value) {
    setState(() {
      _searchText = value;
    });
  }

  void _onCategoryChanged(MarketCategory? category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  void _onFavoritesChanged(bool value) {
    setState(() {
      _favoritesOnly = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            //--------------------------------------------------
            // HEADER
            //--------------------------------------------------

            const SignalHeader(),

            //--------------------------------------------------
            // SEARCH
            //--------------------------------------------------

            SignalSearch(
              onChanged: _onSearchChanged,
            ),

            //--------------------------------------------------
            // FILTER
            //--------------------------------------------------

            SignalFilter(
              selectedCategory: _selectedCategory,
              onCategoryChanged: _onCategoryChanged,
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(18, 8, 18, 12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: FilterChip(
                  avatar: Icon(
                    _favoritesOnly
                        ? Icons.star
                        : Icons.star_border,
                    size: 18,
                    color: Colors.amber,
                  ),
                  label: const Text("Favorites Only"),
                  selected: _favoritesOnly,
                  onSelected: _onFavoritesChanged,
                  selectedColor: AppColors.primary.withOpacity(.15),
                  checkmarkColor: AppColors.primary,
                  side: const BorderSide(
                    color: AppColors.border,
                  ),
                  backgroundColor: AppColors.card,
                ),
              ),
            ),

            //--------------------------------------------------
            // LIST
            //--------------------------------------------------

            Expanded(
              child: SignalList(
                       subscription: UserSubscription.trial,
                       search: _searchText,
                       category: _selectedCategory,
                       favoritesOnly: _favoritesOnly,
                     ),
            ),
          ],
        ),
      ),
    );
  }
}