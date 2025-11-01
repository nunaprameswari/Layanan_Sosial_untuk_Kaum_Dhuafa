import 'dart:async';
import 'package:flutter/material.dart';
import 'package:layanan_sosial_untuk_kaum_dhuafa/navigation/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MyHomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEBDEBF2),
        body: Center(
          child: Container(
            width: 450,
            height: 450,
            child: Image.asset("assets/image/splash.png"),
          ),
        ),
      );
  }
}
