import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:footballapp/Presentation/Pages/home_page.dart';
import 'package:lottie/lottie.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
      splash: Lottie.asset('assets/splash_animation.json'),
      backgroundColor: Colors.black,
      nextScreen: HomePage(),
      splashIconSize: 250,
      duration: 3000, // Duration in milliseconds (3 seconds)
      splashTransition: SplashTransition.fadeTransition,
      ),
    );
  }
}

