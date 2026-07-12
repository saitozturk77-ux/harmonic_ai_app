import 'dart:math';
import 'package:flutter/material.dart';

class MatrixChar {
  MatrixChar({
    required this.char,
    required this.x,
    required this.y,
    required this.speed,
    required this.opacity,
    required this.fontSize,
    this.isHead = false,
  });

  String char;

  double x;
  double y;

  double speed;

  double opacity;

  double fontSize;

  bool isHead;

  static final Random random = Random();

  double pulse = 0;

  static const Color bodyColor = Color(0xFF00D4FF);

  static const Color headColor = Color(0xFFB6FF5E);

  //---------------------------------------------------------

  void update(double dt) {
    y += speed * dt;

    pulse += dt * 5;
  }

  //---------------------------------------------------------

  void render(Canvas canvas) {
    final double alpha =
        opacity.clamp(0.15, 1.0).toDouble();

    final double glow =
        isHead ? 12 + sin(pulse) * 3 : 4;

    final double size =
        isHead ? fontSize + 2 : fontSize;

    final painter = TextPainter(
      text: TextSpan(
        text: char,
        style: TextStyle(
          fontFamily: "monospace",
          fontWeight:
              isHead ? FontWeight.w700 : FontWeight.w500,
          fontSize: size,
          color: isHead
              ? headColor
              : bodyColor.withOpacity(alpha),
          shadows: [
            Shadow(
              color: (isHead ? headColor : bodyColor)
                  .withOpacity(alpha),
              blurRadius: glow,
            )
          ],
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    painter.layout();

    painter.paint(
      canvas,
      Offset(x, y),
    );
  }
}