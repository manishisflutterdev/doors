import 'package:flutter/material.dart';

class Fonts {
  static lobster(double size, Color color) {
    return TextStyle(
      fontFamily: 'Lobster',
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w400,
    );
  }

  static puppies(double size, Color color) {
    return TextStyle(
      fontFamily: 'Puppies Play',
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w400,
    );
  }

  static akebono(double size, Color color) {
    return TextStyle(
      fontFamily: 'Yuji Hentaigana Akebono',
      color: color,
      letterSpacing: 1,
      fontSize: size,
      fontWeight: FontWeight.w400,
    );
  }

  static gwendolyn(double size, Color color) {
    return TextStyle(
      fontFamily: 'Gwendolyn',
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w400,
    );
  }

  static tangerine(double size, Color color) {
    return TextStyle(
      fontFamily: 'Tangerine',
      color: color,
      height: 1.5,
      letterSpacing: 1,
      fontSize: size,
      fontWeight: FontWeight.w400,
    );
  }

  static tangerineBold(double size, Color color) {
    return TextStyle(
      fontFamily: 'Tangerine',
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w700,
    );
  }
}
