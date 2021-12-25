import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_flutter/shared/color_weplant.dart';

class WeplantTheme {
  static TextTheme textTheme = TextTheme(
      button: GoogleFonts.workSans(
          fontWeight: FontWeight.w400, color: Colors.white),
      bodyText1: GoogleFonts.poppins(
          fontWeight: FontWeight.w700,
          fontSize: 16,
          color: ColorsWeplant.colorblackText),
      bodyText2: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: ColorsWeplant.colorBlackBody2),
      subtitle1: GoogleFonts.poppins(
          fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black),
      headline1: GoogleFonts.playfairDisplay(
          fontWeight: FontWeight.w700,
          fontSize: 23,
          color: ColorsWeplant.colorblackText),
      headline5: GoogleFonts.poppins(fontSize: 12, color: Colors.white));

  static ThemeData Light() {

    return ThemeData(
        textTheme: textTheme,
        appBarTheme:
            const AppBarTheme(backgroundColor: Colors.black, elevation: 0),
        brightness: Brightness.light,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: ColorsWeplant.colorPrimary,
            elevation: 0,
            minimumSize: const Size(double.infinity, 50),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
          ),
        ));
  }
}
