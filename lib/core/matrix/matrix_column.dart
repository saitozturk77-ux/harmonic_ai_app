import 'dart:math';
import 'package:flutter/material.dart';

import 'matrix_char.dart';

class MatrixColumn {
  MatrixColumn({
    required this.x,
    required this.screenHeight,
    required this.fontSize,
  }) {
    _createNewWord();
  }

  final double x;
  final double screenHeight;
  final double fontSize;

  final Random _random = Random();

  final List<MatrixChar> chars = [];

  late double speed;
  late double spacing;

  static const List<String> wordPool = [

    // Major Pairs
    "EURUSD",
    "GBPUSD",
    "USDJPY",
    "USDCHF",
    "AUDUSD",
    "NZDUSD",
    "USDCAD",

    // Metals
    "XAUUSD",
    "XAGUSD",

    // Trading
    "BUY",
    "SELL",
    "LONG",
    "SHORT",

    // Indicators
    "MACD",
    "RSI",
    "EMA",
    "SMA",
    "ATR",
    "VWAP",

    // Concepts
    "TREND",
    "BREAKOUT",
    "VOLUME",
    "BULL",
    "BEAR",
    "AI",
    "BOT",

    // Timeframes
    "1M",
    "5M",
    "15M",
    "30M",
    "1H",
    "4H",
    "1D",

    // Confidence
    "95%",
    "97%",
    "99%",
  ];

  //------------------------------------------------------------

  void _createNewWord() {

    chars.clear();

    spacing = fontSize + 8;

    speed = 80 + _random.nextDouble() * 80;

    final word =
        wordPool[_random.nextInt(wordPool.length)];

    final startY =
        -_random.nextDouble() * screenHeight;

    for (int i = 0; i < word.length; i++) {

      chars.add(

        MatrixChar(

          char: word[i],

          x: x,

          y: startY + (i * spacing),

          speed: speed,

          fontSize: fontSize,

          opacity: (1.0 - (i * 0.10))
              .clamp(0.25, 1.0)
              .toDouble(),

          isHead: i == 0,
        ),
      );
    }
  }

  //------------------------------------------------------------

  void update(double dt) {

    for (final c in chars) {
      c.update(dt);
    }

    if (chars.isEmpty) return;

    // Head karakter
    for (int i = 0; i < chars.length; i++) {
      chars[i].isHead = (i == 0);
    }

    // Son karakter ekranın dışına çıktıysa
    if (chars.first.y >
        screenHeight + (chars.length * spacing)) {
      _createNewWord();
    }
  }

  //------------------------------------------------------------

  void render(Canvas canvas) {

    for (final c in chars) {
      c.render(canvas);
    }
  }
}