import 'dart:async';

import 'package:flutter/material.dart';
import 'package:layanan_sosial_untuk_kaum_dhuafa/navigation/home.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
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
