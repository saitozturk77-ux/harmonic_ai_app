import 'package:flutter/material.dart';

import 'matrix_painter.dart';

class MatrixRain extends StatefulWidget {
  const MatrixRain({super.key});

  @override
  State<MatrixRain> createState() => _MatrixRainState();
}

class _MatrixRainState extends State<MatrixRain>
    with SingleTickerProviderStateMixin {

  late final AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(

      vsync: this,

      duration: const Duration(seconds: 6),

    )..repeat();

  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(

      animation: controller,

      builder: (_, __) {

        return CustomPaint(

          painter: MatrixPainter(

            controller.value,

          ),

          size: Size.infinite,

        );

      },

    );

  }
}