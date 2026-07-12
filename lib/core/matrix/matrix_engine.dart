import 'dart:math';

import 'matrix_column.dart';
import 'matrix_config.dart';

class MatrixEngine {

  MatrixEngine();

  final Random random = Random();

  final List<MatrixColumn> columns = [];

  bool initialized = false;

  void initialize(
    double width,
    double height,
  ) {

    if (initialized) return;

    initialized = true;

    double x = 0;

    while (x < width) {

      columns.add(
  MatrixColumn(
    x: x,
    screenHeight: height,
    fontSize: MatrixConfig.fontSize,
  ),
);

      x += MatrixConfig.columnWidth;
    }

  }

  void update(double dt) {

    for (final column in columns) {

      column.update(dt);

    }

  }

}