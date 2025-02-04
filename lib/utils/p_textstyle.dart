import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PTextstyle {
  static TextStyle get headlineLarge => GoogleFonts.inter(
        fontWeight: FontWeight.w900,
        fontSize: 20,
      );
  static TextStyle get titleMedium => GoogleFonts.inter(
        fontWeight: FontWeight.w400,
        fontSize: 16,
      );
      static TextStyle get titleLarge => GoogleFonts.inter(
        fontWeight: FontWeight.w500,
        fontSize: 16,
      );
  static TextStyle get titleSmall => GoogleFonts.inter(
        fontWeight: FontWeight.w400,
        fontSize: 14,
      );
}