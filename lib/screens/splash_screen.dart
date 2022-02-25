import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_flutter/screens/main_screen.dart';
import 'package:mobile_flutter/screens/onboarding/onboarding_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(
      const Duration(milliseconds: 3000),
      () async {
        SharedPreferences pref = await SharedPreferences.getInstance();
        if (pref.getString('uid') != null) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext c) => const MainScreen()));
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext c) => const OnBoardingpage()));
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
            child: SvgPicture.asset(
          'assets/icons/weplant-icon.svg',
          width: MediaQuery.of(context).size.width * 0.4,
        )),
      ),
    );
  }
}
