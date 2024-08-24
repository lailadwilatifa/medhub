import 'dart:async';

import 'package:flutter/material.dart';
import 'package:medhub/services/navigation_service.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    Timer(const Duration(seconds: 3), () { 
      NavigationService().routeToAndRemove('/onboarding');
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Opacity(
              opacity: 0.16,
              child: Image.asset('assets/bg_splash.png'),
            ),
          ),
          Center(
            child: Image.asset(
              'assets/logo.png',
              width: 102,
              height: 134,
            ),
          )
        ],
      ),
    );
  }
}
