import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/weplant_theme.dart';

class OnBoardingContent extends StatelessWidget {
  final String text, image, title;
  const OnBoardingContent(
      {Key? key, required this.text, required this.image, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Image.asset(
            image,
            width: MediaQuery.of(context).size.width * 0.7,
          ),
        ),
        Text(
          title,
          style: WeplantTheme.lightTextTheme.headline2,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
