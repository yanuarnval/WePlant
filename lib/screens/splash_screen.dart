import 'package:flutter/material.dart';
import 'package:mobile_flutter/screens/onboarding_page.dart';

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
      () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext c) => const OnBoardingpage()));
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
          child: Image.asset(
            'assets/logo.png',
            width: MediaQuery.of(context).size.width * 0.4,
          ),
        ),
      ),
    );
  }
}
