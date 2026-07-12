import 'dart:math';
import 'package:flutter/material.dart';

class MatrixPainter extends CustomPainter {
  final double progress;

  MatrixPainter(this.progress);

  final Random random = Random(77);

  static const List<String> words = [

    "EURUSD",
    "GBPUSD",
    "USDJPY",
    "XAUUSD",
    "BTCUSD",

    "BUY",
    "SELL",
    "WAIT",

    "EMA20",
    "EMA50",
    "MACD",
    "RSI",
    "ATR",

    "GARTLEY",
    "BAT",
    "CRAB",
    "BUTTERFLY",

    "91%",
    "94%",
    "88%",

  ];

  @override
  void paint(Canvas canvas, Size size) {

    const columnWidth = 28.0;

    for (double x = 0; x < size.width; x += columnWidth) {

      final y =
          (progress * size.height * 2 +
                  random.nextInt(800)) %
              (size.height + 300);

      drawColumn(
        canvas,
        Offset(x, y),
      );
    }
  }

  void drawColumn(
      Canvas canvas,
      Offset start,
      ) {

    final TextPainter painter = TextPainter(
      textDirection: TextDirection.ltr,
    );

    double y = start.dy;

    for (int i = 0; i < 18; i++) {

      final word =
      words[random.nextInt(words.length)];

      painter.text = TextSpan(

        text: word,

        style: TextStyle(

          color: Colors.greenAccent.withOpacity(
            max(
              0.08,
              1 - (i / 18),
            ),
          ),

          fontSize: 12,

          fontFamily: "monospace",

        ),
      );

      painter.layout();

      painter.paint(
        canvas,
        Offset(start.dx, y),
      );

      y += 20;
    }
  }

  @override
  bool shouldRepaint(
      covariant MatrixPainter oldDelegate) {

    return true;
  }
}