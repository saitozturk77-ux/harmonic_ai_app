import 'dart:math' as math;
import 'package:flutter/material.dart';

class AnimatedTitle extends StatefulWidget {
  const AnimatedTitle({super.key});

  @override
  State<AnimatedTitle> createState() => _AnimatedTitleState();
}

class _AnimatedTitleState extends State<AnimatedTitle>
    with TickerProviderStateMixin {
  late final AnimationController _fadeController;
  late final AnimationController _glowController;

  late final Animation<double> _opacity;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );

    _glowController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2600),
    );

    _opacity = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeOut,
    );

    _fadeController.forward();

    _fadeController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _glowController.repeat(reverse: true);
      }
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _glowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([
        _fadeController,
        _glowController,
      ]),
      builder: (context, child) {

        final glow =
            0.18 + (_glowController.value * 0.25);

        final offset =
            math.sin(_glowController.value * math.pi * 2) * 2;

        return Align(
          alignment: const Alignment(0, 0.42),

          child: Transform.translate(
            offset: Offset(0, offset),

            child: Opacity(

              opacity: _opacity.value,

              child: Column(

                mainAxisSize: MainAxisSize.min,

                children: [

                  Text(

                    "FOREX MATRIX",

                    style: TextStyle(

                      color: Colors.white,

                      fontSize: 33,

                      fontWeight: FontWeight.w800,

                      letterSpacing: 8,

                      shadows: [

                        Shadow(

                          color: const Color(0xff00D4FF)
                              .withOpacity(glow),

                          blurRadius: 28,

                        ),

                      ],

                    ),

                  ),

                  const SizedBox(height: 12),

                  Text(

                    "AI SIGNAL ENGINE",

                    style: TextStyle(

                      color: const Color(0xff7CFF5B)
                          .withOpacity(.85),

                      fontSize: 12,

                      letterSpacing: 6,

                      fontWeight: FontWeight.w500,

                    ),

                  ),

                  const SizedBox(height: 8),

                  Container(

                    width: 170,

                    height: 1.2,

                    decoration: BoxDecoration(

                      gradient: LinearGradient(

                        colors: [

                          Colors.transparent,

                          const Color(0xff00D4FF)
                              .withOpacity(.8),

                          Colors.transparent,

                        ],

                      ),

                    ),

                  ),

                ],

              ),

            ),

          ),

        );
      },
    );
  }
}