import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:mobile_flutter/screens/splash_screen.dart';
import 'package:flutter/services.dart';
import 'package:mobile_flutter/theme/weplant_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const WePlant());
}

class WePlant extends StatelessWidget {
  const WePlant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: WeplantTheme.Light(),
      home: const SplashScreen(),
    );
  }
}
