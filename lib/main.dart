import 'dart:developer';
import 'package:e_commerce/auth/register.dart';
import 'package:e_commerce/firebase_options.dart';
import 'package:e_commerce/pages/SplashScreen.dart';
import 'package:e_commerce/pages/home.dart';
import 'package:e_commerce/provider/cart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'auth/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        log('User is currently signed out!');
      } else {
        log('User is signed in!');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return Cart();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const Splash_Screen(), //Splash_Screen(),
        routes: {
          "Signup": (context) => const SignUp(),
          "login": (context) => const LoginPage(),
          "home": (context) => const Home(),
        },
      ),
    );
  }
}