import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_flutter/shared/color_weplant.dart';

class WeplantTheme {
  static TextTheme textTheme = TextTheme(
      button: GoogleFonts.workSans(
          fontWeight: FontWeight.w400, color: Colors.white),
      bodyText1: GoogleFonts.workSans(
          fontWeight: FontWeight.w700,
          fontSize: 12,
          color: ColorsWeplant.colorProductTitle),
      bodyText2: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: ColorsWeplant.colorTxtSearch),
      subtitle1: GoogleFonts.poppins(
          fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black),
      headline1: GoogleFonts.playfairDisplay(
          fontWeight: FontWeight.w700,
          fontSize: 23,
          color: ColorsWeplant.colorblackText),
      headline2: GoogleFonts.workSans(
          fontWeight: FontWeight.w600,
          fontSize: 20,
          color: ColorsWeplant.colorProductTitle),
      headline3: GoogleFonts.workSans(
          fontSize: 18, color: ColorsWeplant.colorTxtSearch),
      headline5: GoogleFonts.poppins(fontSize: 12, color: Colors.white));

  static ThemeData Light() {
    return ThemeData(
        textTheme: textTheme,
        appBarTheme:
            const AppBarTheme(backgroundColor: Colors.black, elevation: 0),
        brightness: Brightness.light,
        canvasColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: ColorsWeplant.colorPrimary,
            elevation: 0,

            minimumSize: const Size(double.infinity, 50),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          ),
        ));
  }
}
