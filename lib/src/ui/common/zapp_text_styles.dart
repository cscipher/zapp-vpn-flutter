import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ZappFontStyles {
  ZappFontStyles._();

  static TextStyle bodyMediumXs({Color? color}) => GoogleFonts.poppins(
        color: color,
        fontWeight: FontWeight.w700,
        fontSize: 12,
      );
  static TextStyle bodyMediumS({Color? color}) => GoogleFonts.poppins(
        color: color,
        fontWeight: FontWeight.w700,
        fontSize: 14,
      );
  static TextStyle bodyMediumM({Color? color}) => GoogleFonts.poppins(
        color: color,
        fontWeight: FontWeight.w700,
        fontSize: 20,
      );
  static TextStyle bodyMediumL({Color? color}) => GoogleFonts.poppins(
        color: color,
        fontWeight: FontWeight.w700,
        fontSize: 24,
      );

  static TextStyle bodyRegularXs({Color? color}) => GoogleFonts.poppins(
        color: color,
        fontWeight: FontWeight.normal,
        fontSize: 12,
      );
  static TextStyle bodyRegularS({Color? color}) => GoogleFonts.poppins(
        color: color,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      );
  static TextStyle bodyRegularM({Color? color}) => GoogleFonts.poppins(
        color: color,
        fontWeight: FontWeight.normal,
        fontSize: 20,
      );
  static TextStyle bodyRegularL({Color? color}) => GoogleFonts.poppins(
        color: color,
        fontWeight: FontWeight.normal,
        fontSize: 24,
      );
}
