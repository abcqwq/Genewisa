import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GenewisaTextTheme {
  static TextTheme textTheme = TextTheme(
    headline1: GoogleFonts.quicksand(
      fontSize: 46,
      color: Colors.black,
    ),
    bodyText1: GoogleFonts.quicksand(
      fontSize: 14,
      color: Colors.black,
    ),
    bodyText2: GoogleFonts.quicksand(
      fontSize: 14,
      color: const Color(0xFF9FACE6),
      fontWeight: FontWeight.bold,
    ),
    button: GoogleFonts.quicksand(
      fontSize: 14,
      color: Colors.white,
    )
  );
}