import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_flutter/bloc/onboarding_bloc.dart';
import 'package:mobile_flutter/theme/weplant_theme.dart';

import 'package:mobile_flutter/screens/onboarding/onboarding_final.dart';
import 'package:mobile_flutter/shared/color_weplant.dart';

class OnBoardingpage extends StatefulWidget {
  const OnBoardingpage({Key? key}) : super(key: key);

  @override
  _OnBoardingpageState createState() => _OnBoardingpageState();
}

class _OnBoardingpageState extends State<OnBoardingpage> {
  int currentPage = 0;
  final _pageViewController = PageController();
  List<String> onBoardingData = [
    'assets/images/gambar.jpg',
    'assets/images/onboarding1.jpg',
    'assets/images/onboarding2.jpg',
  ];
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
          create: (context) => OnboardingBloc(),
          child: Stack(
            children: [_buildPageView(context), _buildBottom(context)],
          ),
        ),
      ),
    );
  }

  SizedBox _buildPageView(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: BlocBuilder<OnboardingBloc, int>(builder: (context, returnV) {
        return PageView.builder(
          controller: _pageViewController,
          onPageChanged: (value) {
            context.read<OnboardingBloc>().increment(value);
          },
          itemCount: 3,
          itemBuilder: (context, index) {
            if (index == 3) {
              return const OnBoardingFinal();
            } else {
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Image.asset(
                  onBoardingData[index],
                  fit: BoxFit.fill,
                ),
              );
            }
          },
        );
      }),
    );
  }

  Positioned _buildBottom(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.2,
                        bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FadeInRight(
                          duration: const Duration(milliseconds: 1500),
                          child: RichText(
                            text: TextSpan(
                              text: 'Dekorasi ruang mu dengan ',
                              style: WeplantTheme.textTheme.headline1,
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'tanaman',
                                    style: GoogleFonts.roboto(
                                        color: ColorsWeplant.colorGreenFress)),
                                const TextSpan(text: ' cantik!')
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        FadeInRight(
                          duration: const Duration(milliseconds: 1500),
                          child: Text(
                            'Dekorasi yang estetik akan menambah energi yang positif',
                            style: WeplantTheme.textTheme.headline5,
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            3,
                            (index) => _buildDot(index),
                          ),
                        ),
                      ),
                      BlocBuilder<OnboardingBloc, int>(
                          builder: (context, value) {
                        return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: (value == 2)
                                  ? ColorsWeplant.colorGreenFress
                                  : ColorsWeplant.colorPrimary,
                              minimumSize: const Size(100, 45),
                            ),
                            onPressed: () {
                              if (value == 2) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const OnBoardingFinal()));
                              } else {
                                _pageViewController.animateToPage(value + 1,
                                    duration: const Duration(milliseconds: 400),
                                    curve: Curves.easeInOut);
                              }
                            },
                            child: Text(
                              (value == 2) ? 'Get started' : 'Next',
                              style: WeplantTheme.textTheme.button,
                            ));
                      }),
                    ],
                  ),
                ],
              ),
            ),
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
          color: count == index
              ? ColorsWeplant.colorGreenFress.withOpacity((index == 0)
                  ? 1
                  : (index == 1)
                      ? 0.6
                      : 0.4)
              : (currentPage != 0 && index == 0)
                  ? ColorsWeplant.colorGreenFress
                  : (currentPage != 0 && index == 1)
                      ? ColorsWeplant.colorGreenFress.withOpacity(0.8)
                      : Colors.white,
        ),
      );
    });
  }
}
