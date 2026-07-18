import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/premium/premium_service.dart';
import 'core/theme/app_theme.dart';
import 'screens/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final premiumService = PremiumService();
  await premiumService.initialize();

  runApp(
    ChangeNotifierProvider.value(
      value: premiumService,
      child: const ForexMatrixAI(),
    ),
  );
}

class ForexMatrixAI extends StatelessWidget {
  const ForexMatrixAI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Forex Matrix AI',
      theme: AppTheme.darkTheme,
      home: const SplashScreen(),
    );
  }
}