import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'grid_component.dart';
import 'matrix_rain_component.dart';

class MatrixGame extends FlameGame {
  @override
  Color backgroundColor() => const Color(0xFF05070D);

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    // Kamera
    camera.viewfinder.anchor = Anchor.topLeft;

    // Arka plan Grid
    add(
      GridComponent(),
    );

    // Forex Matrix Rain
    add(
      MatrixRainComponent(
        columnSpacing: 16,
        fontSize: 14,
      ),
    );
  }
}