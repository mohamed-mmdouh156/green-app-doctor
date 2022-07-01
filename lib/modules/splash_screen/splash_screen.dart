import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import '../intro_screen/intro_screen.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body : Center(
            child: AnimatedSplashScreen(
              nextScreen: const IntroScreen(),
              splash: const Icon(
                Icons.local_florist_sharp,
                size: 100,
                color: Colors.white,
              ),
              backgroundColor: const Color(0xff38984F),
              splashTransition: SplashTransition.scaleTransition,
            ),
          ),
       );
  }
}
