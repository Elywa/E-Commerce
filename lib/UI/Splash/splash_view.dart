import 'dart:async';

import 'package:e_commerce/UI/Auth/Login/login_view.dart';
import 'package:e_commerce/UI/Home/Home_View.dart';
import 'package:e_commerce/UI/Utils/shared_preference.dart';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static const String splashId = 'SplashView';
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      var box = Hive.box('token');
      var token = box.get('token');

      String route;
      if (token == null) {
        route = LoginView.loginViewId;
      } else {
        route = HomeView.homeViewId;
      }
      debugPrint(
          '==================================== $route and token is : $token ================ ');
      Navigator.pushReplacementNamed(context, route);
    });
    return SafeArea(
      child: Scaffold(
        body: Image.asset(
          'assets/images/splash.jpg',
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }
}
