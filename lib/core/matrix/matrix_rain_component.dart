import 'dart:math';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import 'matrix_column.dart';

class MatrixRainComponent extends PositionComponent {
  MatrixRainComponent({
    this.columnSpacing = 22,
    this.fontSize = 16,
  });

  final double columnSpacing;
  final double fontSize;

  final List<MatrixColumn> _columns = [];
  final Random _random = Random();

  bool _initialized = false;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
  }

  void _buildColumns() {
    final game = findGame();

    if (game == null) return;

    final width = game.size.x;
    final height = game.size.y;

    _columns.clear();

    final totalColumns =
        (width / columnSpacing).floor();

    for (int i = 0; i < totalColumns; i++) {
      final column = MatrixColumn(
        x: i * columnSpacing,
        screenHeight: height,
        fontSize: fontSize,
      );

      // Her sütunu farklı yükseklikten başlat
      final randomOffset =
          _random.nextDouble() * height;

      for (final c in column.chars) {
        c.y -= randomOffset;
      }

      _columns.add(column);
    }

    _initialized = true;
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (!_initialized) {
      _buildColumns();
      return;
    }

    for (final column in _columns) {
      column.update(dt);
    }
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    if (!_initialized) return;

    for (final column in _columns) {
      column.render(canvas);
    }
  }
}