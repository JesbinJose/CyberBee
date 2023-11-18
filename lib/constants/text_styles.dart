import 'package:cyber_bee/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextStyles {
  static TextStyle h1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: MyColors.textWhiteColor,
    fontFamily: GoogleFonts.poppins().fontFamily,
  );
  static TextStyle h2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: MyColors.textRedColor,
    fontFamily: GoogleFonts.poppins().fontFamily,
  );
  static TextStyle h3 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: MyColors.textWhiteColor,
    fontFamily: GoogleFonts.poppins().fontFamily,
  );
  static TextStyle h4 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: MyColors.textWhiteColor,
    fontFamily: GoogleFonts.poppins().fontFamily,
  );
  static TextStyle h5 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: MyColors.textGreyColor,
    fontFamily: GoogleFonts.poppins().fontFamily,
  );
  static TextStyle h6 = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: MyColors.textWhiteColor,
    fontFamily: GoogleFonts.poppins().fontFamily,
  );
}
