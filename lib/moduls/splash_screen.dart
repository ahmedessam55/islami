import 'dart:async';

import 'package:flutter/material.dart';
import 'package:untitled3/layout/Home_Layout.dart';

class Splashscreen extends StatelessWidget {
  static const String routeName = "splash_screen";

  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, HomeLayout.routeName);
    });
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Image.asset(
        "assets/images/splash.png",
        width: mediaQuery.width,
        height: mediaQuery.height,
        fit: BoxFit.cover,
      ),
    );
  }
}
