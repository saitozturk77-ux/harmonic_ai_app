import 'dart:math';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class GridComponent extends PositionComponent {
  GridComponent();

  static const double gridSize = 40.0;

  double _time = 0.0;

  @override
  void update(double dt) {
    super.update(dt);
    _time += dt;
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    final game = findGame();

    if (game == null) return;

    final width = game.size.x;
    final height = game.size.y;

    final double pulse =
        0.045 + (sin(_time * 0.8) + 1) * 0.015;

    final paint = Paint()
      ..color = const Color(0xFF00D4FF).withOpacity(pulse)
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    //-------------------------
    // Vertical Lines
    //-------------------------

    for (double x = 0; x <= width; x += gridSize) {
      canvas.drawLine(
        Offset(x, 0),
        Offset(x, height),
        paint,
      );
    }

    //-------------------------
    // Horizontal Lines
    //-------------------------

    for (double y = 0; y <= height; y += gridSize) {
      canvas.drawLine(
        Offset(0, y),
        Offset(width, y),
        paint,
      );
    }

    //-------------------------
    // Center Glow
    //-------------------------

    final centerPaint = Paint()
      ..shader = RadialGradient(
        colors: [
          const Color(0x2200D4FF),
          Colors.transparent,
        ],
      ).createShader(
        Rect.fromCircle(
          center: Offset(width / 2, height / 2),
          radius: 220,
        ),
      );

    canvas.drawCircle(
      Offset(width / 2, height / 2),
      220,
      centerPaint,
    );
  }
}