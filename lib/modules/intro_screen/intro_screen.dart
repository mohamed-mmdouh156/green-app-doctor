import 'package:flutter/material.dart';

import '../../shared/components/components.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("lib/shared/styles/images/1 - Copy.png"),
                    fit: BoxFit.cover)),
          ),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(
              height: 120,
            ),
            Material(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Icon(
                Icons.local_florist_sharp,
                size: 100,
                color: Colors.green[800],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            defaultText(text: 'Green Doctor', color: Colors.white, fontsize: 30 , ),
            const SizedBox(
              height: 210,
            ),
            defaultElevatedButton(
                text: "Get Started",
                primary: const Color(0xff388E3C),
                onprimary: Colors.white,
                color: Colors.white,
                onPress: () {
                  Navigator.pushReplacementNamed(context, 'LoginScreen');
                }),
            defaultElevatedButton(
                text: "Sign Up",
                primary: Colors.white,
                onprimary: const Color(0xff81C784),
                color: const Color(0xff388E3C),
                top: 10,
                onPress: () => Navigator.pushReplacementNamed(context, 'SignUpScreen')
            ),
          ]),
        ],
      ),
    );
  }
}
