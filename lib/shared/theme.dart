import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color kPrimaryColor = const Color(0xff0F3759);
Color KSuccess = const Color(0xff00A59B);
Color kNeutral900 = const Color(0xff090F47);

TextStyle overpassTextStyle = GoogleFonts.overpass();

TextStyle titleTextStyle = GoogleFonts.overpass(
  fontSize: 24,
  fontWeight: bold,
  color: kNeutral900,
);

TextStyle title2TextStyle = GoogleFonts.overpass(
  fontSize: 16,
  fontWeight: semibold,
  color: kNeutral900,
);

TextStyle descTextStyle = GoogleFonts.overpass(
    fontSize: 16,
    color: kNeutral900.withOpacity(0.45),
    fontWeight: FontWeight.w300);

FontWeight thin = FontWeight.w100;
FontWeight extralight = FontWeight.w200;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semibold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extrabold = FontWeight.w800;
FontWeight black = FontWeight.w900;
