import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_flutter/bloc/login_bloc_credential.dart';

import 'package:mobile_flutter/bloc/onboarding_bloc.dart';
import 'package:mobile_flutter/model/Login_state_model.dart';
import 'package:mobile_flutter/model/login_event.dart';

import 'package:mobile_flutter/screens/login/login_page.dart';
import 'package:mobile_flutter/screens/main_screen.dart';
import 'package:mobile_flutter/screens/register/register_page.dart';

import 'package:mobile_flutter/shared/color_weplant.dart';

class OnBoardingpage extends StatefulWidget {
  const OnBoardingpage({Key? key}) : super(key: key);

  @override
  _OnBoardingpageState createState() => _OnBoardingpageState();
}

class _OnBoardingpageState extends State<OnBoardingpage> {
  final _pageViewController = PageController();
  List<Map<String, String>> assets = [
    {"image": 'assets/images/login-page2.png', "text": "lorem ipsum dolor sit"},
    {"image": 'assets/images/login-page1.png', "text": "lorem ipsum dolor sit"},
    {"image": 'assets/images/login-page3.png', "text": "lorem ipsum dolor sit"}
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
        child: MultiBlocProvider(
          providers: [
            BlocProvider<OnboardingBloc>(create: (_) => OnboardingBloc()),
            BlocProvider<LoginBlocCredential>(
                create: (_) => LoginBlocCredential())
          ],
          child: BlocListener<LoginBlocCredential, LoginAuthState>(
            listener: (_, state) {
              if (state is SuccesLoadLoginAuthState) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext c) => const MainScreen()));
              }
            },
            child: Column(
              children: [_buildSliderEvent(), _buildBottom(context)],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _buildSliderEvent() {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.57,
      child: BlocBuilder<OnboardingBloc, int>(builder: (context, current) {
        return Stack(
          children: [
            PageView(
                scrollDirection: Axis.horizontal,
                onPageChanged: (index) {
                  context.read<OnboardingBloc>().increment(index);
                },
                children: List.generate(
                  3,
                  (index) => Stack(
                    children: [
                      Positioned(
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Image.asset(
                            assets[index]['image'].toString(),
                            height: MediaQuery.of(context).size.height * 0.5,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 14,
                        left: 0,
                        right: 0,
                        child: Center(
                            child: Text(
                          assets[index]['text'].toString(),
                          style: GoogleFonts.poppins(
                              color: Colors.black, fontSize: 22),
                        )),
                      )
                    ],
                  ),
                )),
            Positioned(
                bottom: 5,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                      List.generate(3, (index) => _buildDot(current, index)),
                ))
          ],
        );
      }),
    );
  }

  Expanded _buildBottom(BuildContext context) {
    return Expanded(
      flex: 1,
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
          child: Column(
            children: [
              Text(
                'Login and Registration are free',
                style:
                    GoogleFonts.poppins(color: Colors.black.withOpacity(0.3)),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext c) => const LoginPage()));
                },
                child: Text(
                  'Log in',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext c) => const RegisterPage()));
                  },
                  child: Text(
                    'Sign up',
                    style: GoogleFonts.poppins(color: Colors.white),
                  )),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 1,
                    width: (MediaQuery.of(context).size.width * 0.5) - 40,
                    color: Colors.grey,
                  ),
                  Text(
                    'Or',
                    style:
                        GoogleFonts.poppins(fontSize: 14, color: Colors.grey),
                  ),
                  Container(
                    height: 1,
                    width: (MediaQuery.of(context).size.width * 0.5) - 40,
                    color: Colors.grey,
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      blurRadius: 6,
                      offset: const Offset(2, 5),
                    ),
                  ],
                ),
                child: BlocBuilder<LoginBlocCredential, LoginAuthState>(
                    builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () {
                      context
                          .read<LoginBlocCredential>()
                          .add(LoginWithCredential());
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/google-icon.svg',
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          'Sign up with Google',
                          style: GoogleFonts.poppins(color: Colors.black),
                        )
                      ],
                    ),
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }

  BlocBuilder _buildDot(int current, int index) {
    return BlocBuilder<OnboardingBloc, int>(builder: (context, current) {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(left: 5),
        width: (current == index) ? 27 : 7,
        height: 7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: ColorsWeplant.colorPrimary,
        ),
      );
    });
  }
}
