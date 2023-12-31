import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/images/main_logo_white.png",
          height: 300,
          width: 300,
        ),
      ),
    );
  }

  void startTimer() {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      GoRouter.of(context).pushReplacementNamed("home");
      timer.cancel();
    });
  }
}
