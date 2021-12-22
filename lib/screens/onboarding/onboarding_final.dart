import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/screens/home/home_page.dart';
import 'package:mobile_flutter/screens/main_screen.dart';
import 'package:mobile_flutter/shared/color_weplant.dart';

class OnBoardingFinal extends StatefulWidget {
  const OnBoardingFinal({Key? key}) : super(key: key);

  @override
  _OnBoardingFinalState createState() => _OnBoardingFinalState();
}

class _OnBoardingFinalState extends State<OnBoardingFinal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Spacer(
                flex: 1,
              ),
              FadeInUp(
                duration: const Duration(milliseconds: 1500),
                child: Image.asset(
                  "assets/onboarding/onboardingfinal.png",
                  width: MediaQuery.of(context).size.width * 0.7,
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeInUp(
                      duration: const Duration(milliseconds: 1000),
                      delay: const Duration(milliseconds: 1000),
                      child: const Text(
                        "WEPLANT Is The Bigges Plant Shop In World",
                        style: TextStyle(
                          fontSize: 28,
                          color: ColorsWeplant.colorPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FadeInUp(
                      duration: const Duration(milliseconds: 1000),
                      delay: const Duration(milliseconds: 1200),
                      child: Text(
                        '"If you have a garden and a library, you have everything you need." - Marcus Tullius Cicero',
                        style: TextStyle(fontSize: 15, color: Colors.grey[600]),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    FadeInUp(
                      duration: const Duration(milliseconds: 1000),
                      delay: const Duration(milliseconds: 1000),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MaterialButton(
                                color: ColorsWeplant.colorPrimary,
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const MainScreen()));
                                }),
                            MaterialButton(
                                color: Colors.white,
                                elevation: 2,
                                child: const Text(
                                  "Register",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                onPressed: () {}),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
