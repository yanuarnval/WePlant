import 'package:flutter/material.dart';

import 'package:mobile_flutter/screens/splash_screen.dart';
import 'package:mobile_flutter/shared/color_weplant.dart';
import 'package:mobile_flutter/theme/weplant_theme.dart';

void main() => runApp(const WePlant());

class WePlant extends StatelessWidget {
  const WePlant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: WeplantTheme.Light(),
      home: const SplashScreen(),
    );
  }
}
