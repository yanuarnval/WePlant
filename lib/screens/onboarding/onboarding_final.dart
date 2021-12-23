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
              child: Container(
                height: 200,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15)),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white, elevation: 3),
                          onPressed: () {},
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.login,color: Colors.black,),
                              Text(
                                'login',
                                style: GoogleFonts.workSans(color: Colors.black),
                              ),
                            ],
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                          onPressed: () {}, child: const Text('register'))
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
