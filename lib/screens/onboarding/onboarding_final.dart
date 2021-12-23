import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_flutter/screens/home/home_page.dart';
import 'package:mobile_flutter/screens/main_screen.dart';
import 'package:mobile_flutter/shared/color_weplant.dart';
import 'package:mobile_flutter/theme/weplant_theme.dart';

class OnBoardingFinal extends StatefulWidget {
  const OnBoardingFinal({Key? key}) : super(key: key);

  @override
  _OnBoardingFinalState createState() => _OnBoardingFinalState();
}

class _OnBoardingFinalState extends State<OnBoardingFinal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/gambar.jpg',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fill,
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    height: 200,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
