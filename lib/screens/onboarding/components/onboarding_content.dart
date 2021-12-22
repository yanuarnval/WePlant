import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_flutter/shared/color_weplant.dart';
import 'package:mobile_flutter/theme/weplant_theme.dart';

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
          style: WeplantTheme.textTheme.headline1,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            text,
            style: WeplantTheme.textTheme.bodyText2,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
