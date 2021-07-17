import 'package:alodjinha/core/ui/app_colors.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

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
    required double height,
    required FontWeightName fontWeight,
    required Color fontColor,
  }) {
    return GoogleFonts.pacifico(
      textStyle: TextStyle(
        fontSize: fontSize,
        fontWeight: getFontWeight(fontWeight),
        height: height,
        color: fontColor,
      ),
    );
  }

  static TextStyle _tsRoboto({
    required double fontSize,
    required double height,
    required FontWeightName fontWeight,
    required Color fontColor,
  }) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        fontSize: fontSize,
        fontWeight: getFontWeight(fontWeight),
        height: height,
        color: fontColor,
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
      height: 1.5,
      fontWeight: FontWeightName.REGULAR,
      fontColor: AppColors.dark);

  static final TextStyle logoMenu = _tsPacifico(
      fontSize: 24,
      height: 0.6,
      fontWeight: FontWeightName.REGULAR,
      fontColor: AppColors.dark);

  static final TextStyle precoPor = _tsRoboto(
      fontSize: 20,
      height: 1,
      fontWeight: FontWeightName.BOLD,
      fontColor: AppColors.dark);

  static final TextStyle descricaoProduto = _tsRoboto(
      fontSize: 18,
      height: 1,
      fontWeight: FontWeightName.MEDIUM,
      fontColor: AppColors.dark);

  static final TextStyle descricaoProdutoBold = _tsRoboto(
      fontSize: 17,
      height: 0.4,
      fontWeight: FontWeightName.BOLD,
      fontColor: AppColors.dark);

  static final TextStyle nomeDesenvolvedor = _tsRoboto(
      fontSize: 14,
      height: 0.3,
      fontWeight: FontWeightName.MEDIUM,
      fontColor: AppColors.dark);

  static final TextStyle menuItem = _tsRoboto(
      fontSize: 14,
      height: 0.3,
      fontWeight: FontWeightName.MEDIUM,
      fontColor: AppColors.dark);

  static final TextStyle nomeCategoria = _tsRoboto(
      fontSize: 13,
      height: 1,
      fontWeight: FontWeightName.REGULAR,
      fontColor: AppColors.dark);

  static final TextStyle precoDe = _tsRoboto(
      fontSize: 12,
      height: 1,
      fontWeight: FontWeightName.MEDIUM,
      fontColor: AppColors.dark);

  static final TextStyle dataDesenvolvimento = _tsRoboto(
      fontSize: 12,
      height: 0.3,
      fontWeight: FontWeightName.LIGHT,
      fontColor: AppColors.dark);
}
