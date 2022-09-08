// ignore_for_file: unnecessary_null_comparison

import 'dart:async';

// import 'package:animated_splash_screen/animated_splash_screen.dart';
// import 'package:brook_woods01/services/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../secure_storage.dart';
import 'Navbar/nav_bar.dart';
import 'login_page.dart';

// class AnimatedPage extends StatefulWidget {
//   const AnimatedPage({Key? key}) : super(key: key);

//   @override
//   State<AnimatedPage> createState() => _AnimatedPageState();
// }

// class _AnimatedPageState extends State<AnimatedPage> {
//   final SecureStorage secureStorage = SecureStorage();
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedSplashScreen(
//       splash: Image.asset('assets/furnitures.png'),
//       disableNavigation: false,
//       nextScreen: MyLogin(),
//       splashIconSize: 150,
//       backgroundColor: Colors.indigo.shade700,
//       splashTransition: SplashTransition.slideTransition,
//       animationDuration: Duration(seconds: 2),
//       curve: Curves.bounceOut,
//       duration: 1500,
//     );
//   }
// }
String? finalEmail, finalName;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SecureStorage secureStorage = SecureStorage();
  @override
  void initState() {
    secureStorage.readSecureData('email').then((value) {
      finalEmail = value;
    });
    secureStorage.readSecureData('name').then((value) {
      finalName = value;
    });
    Timer(
        Duration(seconds: 3),
            () => Navigator.pushReplacement(
            context,
            PageTransition(
                child: finalEmail == null ? MyLogin() : NavPage(),
                type: PageTransitionType.rightToLeftWithFade)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade700,
      body: Container(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: SizedBox(
                    height: 130.0,
                    child: Image.asset(
                      'assets/furnitures.png',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 80),
                  child: SizedBox(
                    height: 40,
                    width: 40,
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}