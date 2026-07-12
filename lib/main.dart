import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'screens/splash/splash_screen.dart';

void main() {

  runApp(const ForexMatrixAI());

}

class ForexMatrixAI extends StatelessWidget {

  const ForexMatrixAI({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      title: "Forex Matrix AI",

      theme: AppTheme.darkTheme,

      home: const SplashScreen(),

    );

  }

}