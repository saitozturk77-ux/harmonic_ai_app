import 'dart:async';

import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import '../../core/matrix/matrix_game.dart';
import '../main/main_screen.dart';

import 'animated_logo.dart';
import 'animated_title.dart';
import 'loading_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    _goToMain();
  }

  Future<void> _goToMain() async {
    await Future.delayed(const Duration(milliseconds: 2800));

    if (!mounted) return;

    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 600),
        reverseTransitionDuration: const Duration(milliseconds: 300),
        pageBuilder: (_, animation, secondaryAnimation) =>
            const MainScreen(),
        transitionsBuilder: (_, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            ),
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF05070D),
      body: Stack(
        fit: StackFit.expand,
        children: [

          //----------------------------------------------------------
          // MATRIX BACKGROUND
          //----------------------------------------------------------

          Positioned.fill(
            child: ShaderMask(
              shaderCallback: (rect) {
                return const RadialGradient(
                  center: Alignment(0, -0.08),
                  radius: 0.36,
                  colors: [
                    Colors.transparent,
                    Colors.transparent,
                    Color(0xAA000000),
                    Color(0xFF000000),
                  ],
                  stops: [
                    0.00,
                    0.42,
                    0.72,
                    1.00,
                  ],
                ).createShader(rect);
              },
              blendMode: BlendMode.dstOut,
              child: GameWidget(
                game: MatrixGame(),
              ),
            ),
          ),

          //----------------------------------------------------------
          // LOGO
          //----------------------------------------------------------

          const AnimatedLogo(),

          //----------------------------------------------------------
          // TITLE
          //----------------------------------------------------------

          const AnimatedTitle(),

          //----------------------------------------------------------
          // LOADING
          //----------------------------------------------------------

          const LoadingWidget(),
        ],
      ),
    );
  }
}