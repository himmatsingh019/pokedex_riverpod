import 'package:flutter/material.dart';
import 'package:pokedex_riverpod/core/utils/constants.dart';

class AppFonts {
  static TextStyle extraBoldStyle({
    double fontSize = 12.0,
    double letterSpacing = 0.5,
    double wordSpacing = 0.3,
    double height = 1,
    String fontType = 'Noto Sans',
    Color fontColor = AppColors.blackColor,
    FontWeight fontWeight = FontWeight.w800,
    TextDecoration decoration = TextDecoration.none,
    Color backgroundColor = AppColors.transparent,
  }) {
    final Paint paint = Paint();
    paint.color = backgroundColor;
    return TextStyle(
      letterSpacing: letterSpacing,
      height: height,
      wordSpacing: wordSpacing,
      fontFamily: fontType,
      color: fontColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
      decoration: decoration,
      background: paint,
    );
  }
}
