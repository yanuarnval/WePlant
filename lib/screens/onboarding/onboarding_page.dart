import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_flutter/bloc/onboarding_bloc.dart';
import 'package:mobile_flutter/login/login_page.dart';
import 'package:mobile_flutter/theme/weplant_theme.dart';
import 'package:mobile_flutter/shared/color_weplant.dart';

class OnBoardingpage extends StatefulWidget {
  const OnBoardingpage({Key? key}) : super(key: key);

  @override
  _OnBoardingpageState createState() => _OnBoardingpageState();
}

class _OnBoardingpageState extends State<OnBoardingpage> {
  final _pageViewController = PageController();

  @override
  void dispose() {
    // TODO: implement dispose
    _pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
            create: (_) => OnboardingBloc(),
            child: Stack(
              children: [_buildSliderEvent(), _buildBottom(context)],
            )),
      ),
    );
  }

  SizedBox _buildSliderEvent() {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      child: Image.asset(
        'assets/images/onboarding.jpg',
        fit: BoxFit.fill,
      ),
    );
  }

  Positioned _buildBottom(BuildContext context) {
    return Positioned(
      left: 15,
      right: 15,
      bottom: 15,
      child: ClipRRect(
        borderRadius:  BorderRadius.circular(15),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: Container(
            decoration:  BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
                child: Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext c) => LoginPage()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              padding: const EdgeInsets.all(7),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.red),
                              child: const Icon(
                                Icons.mail,
                                size: 20,
                              )),
                          Text(
                            'Login With Email',
                            style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            width: 34,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                        ),
                        onPressed: () {},
                        child: Text(
                          'Register',
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w500, color: Colors.black),
                        ))
                  ],
                )),
          ),
        ),
      ),
    );
  }

  BlocBuilder _buildDot(int index) {
    return BlocBuilder<OnboardingBloc, int>(builder: (context, count) {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(left: 5),
        width: 9.5,
        height: 9.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: ColorsWeplant.colorPrimary,
        ),
      );
    });
  }
}
