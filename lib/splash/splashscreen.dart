import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFEBDEBF2),
        body: Center(
          child: Container(
            width: 450,
            height: 450,
            child: Image.asset("assets/image/splash.png"),
          ),
        ),
      ),
    );
  }
}
