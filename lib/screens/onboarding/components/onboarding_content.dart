import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_flutter/shared/color_weplant.dart';
import 'package:mobile_flutter/theme/weplant_theme.dart';

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> onBoardingData = [
      {
        "image": 'assets/gambar.jpg',
      },
      {
        "image": 'assets/onboarding/onboarding2.png',
      },
      {
        "image": 'assets/onboarding/onboarding3.png',
      }
    ];
    return Column(
      children: [
        Expanded(
          child: Image.asset(
            onBoardingData[0]['image']!,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ],
    );
  }
}
