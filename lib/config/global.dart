library globals;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: non_constant_identifier_names
class Palette {
  static const Color PrimaryColor =
      Color(0xFF09333f);
  static const Color secondaryColor =
      Color(0xFF26f7b2);
  static const Color BLACK = Color(0xFF000000);
  static const Color WHITE = Color(0xFFffffff);
}

class Text_Style {
  static TextStyle Header = GoogleFonts.ubuntu(
      fontSize: 24, fontWeight: FontWeight.bold);
  static TextStyle Normal = GoogleFonts.roboto(
    fontSize: 18,
    fontWeight: FontWeight.normal,
  );
  static TextStyle text = GoogleFonts.roboto(
      fontWeight: FontWeight.bold,
      color: Palette.WHITE,
      fontSize: 15);
  ubuntu(double fontSize, FontWeight fontWeight,
      Color color) {
    return GoogleFonts.ubuntu(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  roboto(double fontSize, FontWeight fontWeight,
      Color color) {
    return GoogleFonts.roboto(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }
}
