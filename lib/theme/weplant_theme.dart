import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_flutter/shared/color_weplant.dart';

class WeplantTheme {
  static ThemeData Light() {
    return ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        brightness: Brightness.light,
        primaryColor: ColorsWeplant.colorPrimary,
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
