import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news/pages/home/home_view.dart';

class SplashView extends StatefulWidget {
  static const String routeName = 'splash';
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(context, HomeView.routeName),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('assets/images/background_pattern.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: Image.asset('assets/images/logo.png'),
            ),
            Positioned(
              bottom: 0,
              child: Image.asset('assets/images/branding.png'),
            ),
          ],
        ),
      ),
    );
  }
}