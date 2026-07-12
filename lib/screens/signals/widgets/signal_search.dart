import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';

class SignalSearch extends StatefulWidget {
  const SignalSearch({
    super.key,
    required this.onChanged,
  });

  final ValueChanged<String> onChanged;

  @override
  State<SignalSearch> createState() => _SignalSearchState();
}

class _SignalSearchState extends State<SignalSearch> {
  final TextEditingController _controller = TextEditingController();

  bool _hasText = false;

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      if (!mounted) return;

      setState(() {
        _hasText = _controller.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _clearSearch() {
    _controller.clear();
    widget.onChanged('');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 8, 18, 16),
      child: Container(
        height: 58,
        decoration: BoxDecoration(
          gradient: AppColors.cardGradient,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: AppColors.border,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryGlow.withOpacity(.08),
              blurRadius: 14,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          children: [
            const SizedBox(width: 14),

            const Icon(
              Icons.search_rounded,
              color: AppColors.primary,
              size: 24,
            ),

            const SizedBox(width: 10),

            Expanded(
              child: TextField(
                controller: _controller,
                onChanged: widget.onChanged,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 15,
                ),
                cursorColor: AppColors.primary,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search pair (EURUSD, XAUUSD...)",
                  hintStyle: TextStyle(
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            ),

            AnimatedOpacity(
              opacity: _hasText ? 1 : 0,
              duration: const Duration(milliseconds: 200),
              child: IconButton(
                onPressed: _hasText ? _clearSearch : null,
                icon: const Icon(
                  Icons.close_rounded,
                  color: AppColors.textSecondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}