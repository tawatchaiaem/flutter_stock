import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData appTheme() {
  return ThemeData(
      textTheme: GoogleFonts.kanitTextTheme(),
      primaryColor: Colors.blue,
      // accentColor: Colors.blue,
      hintColor: Colors.blue,
      // buttonColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      canvasColor: Colors.white);
}
