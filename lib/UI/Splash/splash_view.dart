import 'dart:async';

import 'package:e_commerce/UI/Auth/Login/login_view.dart';

import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static const String splashId = 'SplashView';
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, LoginView.loginViewId);
    });
    return SafeArea(
      child: Scaffold(
        body: Image.asset(
          'assets/images/Splash Screen.png',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }
}
