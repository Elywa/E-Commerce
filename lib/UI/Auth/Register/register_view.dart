import 'package:e_commerce/UI/Auth/Register/widgets/Register_View_Body.dart';
import 'package:e_commerce/UI/Utils/colors.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static const String registerViewId = 'RegisterView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: RegisterViewBody(),
    );
  }
}
