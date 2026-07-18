import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../screens/premium/premium_screen.dart';
import 'premium_service.dart';

class PremiumGuard extends StatelessWidget {
  final Widget child;
  final bool pushReplacement;

  const PremiumGuard({
    super.key,
    required this.child,
    this.pushReplacement = false,
  });

  @override
  Widget build(BuildContext context) {
    final premiumService = context.watch<PremiumService>();

    if (premiumService.isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (premiumService.isPremium) {
      return child;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!context.mounted) return;

      final route = MaterialPageRoute(
        builder: (_) => const PremiumScreen(),
      );

      if (pushReplacement) {
        Navigator.of(context).pushReplacement(route);
      } else {
        Navigator.of(context).push(route);
      }
    });

    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}