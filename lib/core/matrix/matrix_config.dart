import 'package:flutter/material.dart';

class MatrixConfig {
  MatrixConfig._();

  /// Screen

  static const Color background = Color(0xff05070D);

  /// Matrix

  static const Color bright = Color(0xffA8FF60);

  static const Color normal = Color(0xff00FF66);

  static const Color dim = Color(0xff00AA44);

  /// Font

  static const double fontSize = 13;

  static const double lineHeight = 18;

  static const double columnWidth = 22;

  /// Engine

  static const int columnCount = 90;

  static const int minLength = 8;

  static const int maxLength = 22;

  static const double minSpeed = 70;

  static const double maxSpeed = 240;

  static const Duration frame =
      Duration(milliseconds: 16);
}