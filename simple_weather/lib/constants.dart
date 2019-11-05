import 'package:flutter/material.dart';
class GlobalStyles {
  static TextStyle getTextStyle(double value, Color color, FontWeight weight) {
    return TextStyle(
      color: color == null ? Colors.white: color,
      fontSize: value == null? 15 : value,
      fontWeight: weight
    );
  }
}