import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

enum FontWeightName {
  THIN,
  EXTRA_LIGHT,
  LIGHT,
  REGULAR,
  MEDIUM,
  SEMI_BOLD,
  BOLD,
  EXTRA_BOLD,
  BLACK
}

class AppTypography {
  static TextStyle _tsPacifico({
    required double fontSize,
    required FontWeightName fontWeight,
    required Color fontColor,
    TextDecoration? decoration,
  }) {
    return GoogleFonts.pacifico(
      textStyle: TextStyle(
        fontSize: fontSize,
        fontWeight: getFontWeight(fontWeight),
        color: fontColor,
        decoration: decoration,
      ),
    );
  }

  static TextStyle _tsRoboto({
    required double fontSize,
    required FontWeightName fontWeight,
    required Color fontColor,
    TextDecoration? decoration,
  }) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        fontSize: fontSize,
        fontWeight: getFontWeight(fontWeight),
        color: fontColor,
        decoration: decoration,
      ),
    );
  }

  static FontWeight getFontWeight(FontWeightName fwn) {
    switch (fwn) {
      case FontWeightName.THIN:
        return FontWeight.w100;
      case FontWeightName.EXTRA_LIGHT:
        return FontWeight.w200;
      case FontWeightName.LIGHT:
        return FontWeight.w300;
      case FontWeightName.REGULAR:
        return FontWeight.w400;
      case FontWeightName.MEDIUM:
        return FontWeight.w500;
      case FontWeightName.SEMI_BOLD:
        return FontWeight.w600;
      case FontWeightName.BOLD:
        return FontWeight.w700;
      case FontWeightName.EXTRA_BOLD:
        return FontWeight.w800;
      case FontWeightName.BLACK:
        return FontWeight.w900;
      default:
        return FontWeight.w400;
    }
  }

  static final TextStyle logoSobre = _tsPacifico(
      fontSize: 64,
      fontWeight: FontWeightName.REGULAR,
      fontColor: AppColors.dark);

  static final TextStyle logoMenu = _tsPacifico(
      fontSize: 24,
      fontWeight: FontWeightName.REGULAR,
      fontColor: AppColors.white);

  static final TextStyle precoPor = _tsRoboto(
      fontSize: 20,
      fontWeight: FontWeightName.BOLD,
      fontColor: AppColors.tomato);

  static final TextStyle descricaoProduto = _tsRoboto(
      fontSize: 18,
      fontWeight: FontWeightName.MEDIUM,
      fontColor: AppColors.dark);

  static final TextStyle descricaoProdutoBold = _tsRoboto(
      fontSize: 17, fontWeight: FontWeightName.BOLD, fontColor: AppColors.dark);

  static final TextStyle nomeDesenvolvedor = _tsRoboto(
      fontSize: 14,
      fontWeight: FontWeightName.MEDIUM,
      fontColor: AppColors.dark);

  static final TextStyle menuItem = _tsRoboto(
      fontSize: 14,
      fontWeight: FontWeightName.MEDIUM,
      fontColor: AppColors.dark);

  static final TextStyle nomeCategoria = _tsRoboto(
      fontSize: 13,
      fontWeight: FontWeightName.REGULAR,
      fontColor: AppColors.dark);

  static final TextStyle precoDe = _tsRoboto(
    fontSize: 12,
    fontWeight: FontWeightName.MEDIUM,
    fontColor: AppColors.dark,
    decoration: TextDecoration.lineThrough,
  );

  static final TextStyle dataDesenvolvimento = _tsRoboto(
      fontSize: 12,
      fontWeight: FontWeightName.LIGHT,
      fontColor: AppColors.dark);
}
