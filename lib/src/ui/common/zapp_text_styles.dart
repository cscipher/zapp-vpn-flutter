import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ZappFontStyles {
  ZappFontStyles._();

  static TextStyle _googleFont({
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
  }) =>
      GoogleFonts.notoSans(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
      );

  static TextStyle custom({
    Color? color,
    required double fontSize,
    required FontWeight weight,
  }) =>
      _googleFont(
        color: color,
        fontWeight: weight,
        fontSize: fontSize,
      );

  static TextStyle bodyBoldXs({Color? color}) => _googleFont(
        color: color,
        fontWeight: FontWeight.w700,
        fontSize: 14,
      );
  static TextStyle bodyBoldS({Color? color}) => _googleFont(
        color: color,
        fontWeight: FontWeight.w700,
        fontSize: 16,
      );
  static TextStyle bodyBoldM({Color? color}) => _googleFont(
        color: color,
        fontWeight: FontWeight.w700,
        fontSize: 20,
      );
  static TextStyle bodyBoldL({Color? color}) => _googleFont(
        color: color,
        fontWeight: FontWeight.w700,
        fontSize: 24,
      );

  static TextStyle bodyMediumXs({Color? color}) => _googleFont(
        color: color,
        fontWeight: FontWeight.w600,
        fontSize: 14,
      );
  static TextStyle bodyMediumS({Color? color}) => _googleFont(
        color: color,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      );
  static TextStyle bodyMediumM({Color? color}) => _googleFont(
        color: color,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      );
  static TextStyle bodyMediumL({Color? color}) => _googleFont(
        color: color,
        fontWeight: FontWeight.w600,
        fontSize: 24,
      );

  static TextStyle bodyRegularXs({Color? color}) => _googleFont(
        color: color,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      );
  static TextStyle bodyRegularS({Color? color}) => _googleFont(
        color: color,
        fontWeight: FontWeight.w400,
        fontSize: 16,
      );
  static TextStyle bodyRegularM({Color? color}) => _googleFont(
        color: color,
        fontWeight: FontWeight.w400,
        fontSize: 20,
      );
  static TextStyle bodyRegularL({Color? color}) => _googleFont(
        color: color,
        fontWeight: FontWeight.w400,
        fontSize: 24,
      );
}
