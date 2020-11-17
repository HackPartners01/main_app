import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Variables which are not set as const, if changed, need hot restart to show effects instead of hot reload

const Color kColorWhite = Color(0xFFEFFFFB);
const Color kColorGreen = Color(0xFF50D890);
const Color kColorBlue = Color(0xFF4F98CA);
const Color kColorBlack = Color(0xFF272727);

const double kBottomAppBarHeight = 55.0;
const double kBottomAppBarIconSize = 25.0;
const EdgeInsets kBottomAppBarIconMargin = EdgeInsets.only(top: 5.0);

TextStyle kBottomAppBarTextStyle = GoogleFonts.openSans(
  textStyle: TextStyle(
    fontSize: 15.0,
  ),
);
TextStyle kTopAppBarTextStyle = GoogleFonts.openSans(
  textStyle: TextStyle(
    fontSize: 20.0,
  ),
);

TextStyle kCircleImageAndLabelTextStyle = GoogleFonts.openSans(
  textStyle: TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.bold,
  ),
);
