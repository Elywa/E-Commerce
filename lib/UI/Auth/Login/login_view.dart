import 'package:e_commerce/UI/Auth/Login/widgets/Login_View_body.dart';
import 'package:e_commerce/UI/Utils/colors.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String loginViewId = 'LoginView';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: AppColors.primaryColor, body: LoginViewBody());
  }
}
