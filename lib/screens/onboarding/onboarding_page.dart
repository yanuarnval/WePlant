import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/onboarding_content.dart';
import 'package:mobile_flutter/screens/onboarding/onboarding_final.dart';
import 'package:mobile_flutter/shared/color_weplant.dart';

class OnBoardingpage extends StatefulWidget {
  const OnBoardingpage({Key? key}) : super(key: key);

  @override
  _OnBoardingpageState createState() => _OnBoardingpageState();
}

class _OnBoardingpageState extends State<OnBoardingpage> {
  int currentPage = 0;
  List<Map<String, String>> onBoardingData = [
    {
      "title": "Hobbies Are Fun!",
      "text": 'Connect with people with similar hobbies in your city.',
      "image": 'assets/onboarding/onboarding1.png',
    },
    {
      "title": "Find Hobbies",
      "text": 'Connect with people with similar hobbies in your city.',
      "image": 'assets/onboarding/onboarding2.png',
    },
    {
      "title": "5 Hobbies Nearby!",
      "text": 'Connect with people with similar hobbies in your city.',
      "image": 'assets/onboarding/onboarding3.png',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: onBoardingData.length,
                itemBuilder: (context, index) {
                  if (index == onBoardingData.length) {
                    return const OnBoardingFinal();
                  } else {
                    return OnBoardingContent(
                      text: onBoardingData[index]["text"]!,
                      image: onBoardingData[index]["image"]!,
                      title: onBoardingData[index]["title"]!,
                    );
                  }
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        onBoardingData.length,
                        (index) => _buildDot(index),
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                        width: 130,
                        height: 45,
                        child: (currentPage == (onBoardingData.length - 1))
                            ? _buildButtonStart(context)
                            : const SizedBox()),
                    const Spacer()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  MaterialButton _buildButtonStart(BuildContext context) {
    return MaterialButton(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      autofocus: false,
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext c) {
              return const OnBoardingFinal();
            },
          ),
        );
      },
      color: ColorsWeplant.colorPrimary,
      elevation: 0,
      child: Text(
        "get started",
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: currentPage == (onBoardingData.length - 1)
                ? Colors.white
                : Colors.black),
      ),
    );
  }

  AnimatedContainer _buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(left: 5),
      width: currentPage == index ? 20 : 6,
      height: 6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: currentPage == index ? ColorsWeplant.colorPrimary : Colors.grey,
      ),
    );
  }
}
