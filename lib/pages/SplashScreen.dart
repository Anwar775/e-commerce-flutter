import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:e_commerce/auth/login.dart';
import 'package:e_commerce/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Splash_Screen extends StatelessWidget {
  const Splash_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    // check firebase auth status
    // if (FirebaseAuth.instance.currentUser != null) {
    //   Navigator.pushReplacement(
    //       context, MaterialPageRoute(builder: (context) => const Home()));
    // }

    return AnimatedSplashScreen(
      splash: Lottie.asset('images/animation_lo5upl4q.json'),
      nextScreen: FirebaseAuth.instance.currentUser != null ? const Home() : const LoginPage(),
      // nextScreen:   LoginPage(),
      splashIconSize: 450,
      duration: 3000,
      animationDuration: const Duration(seconds: 2),
      backgroundColor: Colors.black,
    );
  }
}

//Details(product: item(Path: 'Path', price: 2, name: 'name'), price: item(Path: "Path", price: 1, name: 'name'),),