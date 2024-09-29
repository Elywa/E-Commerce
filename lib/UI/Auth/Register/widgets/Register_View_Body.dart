import 'package:e_commerce/UI/Auth/Register/widgets/Custom_Button.dart';
import 'package:e_commerce/UI/Auth/Register/widgets/Route_Title.dart';
import 'package:e_commerce/UI/Auth/Register/widgets/text_form_field.dart';
import 'package:flutter/material.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  TextEditingController fullNameController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  GlobalKey formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const RouteTitle(),
              TextFieldItem(
                hintText: 'enter your full name',
                label: 'Full Name',
                textController: TextEditingController(),
              ),
              TextFieldItem(
                hintText: 'enter your phone number',
                label: 'Phone Number',
                textController: phoneNumberController,
              ),
              TextFieldItem(
                hintText: 'enter your email address',
                label: 'Email',
                textController: emailController,
              ),
              TextFieldItem(
                hintText: 'enter your password',
                label: 'Password',
                keyboardTupe: TextInputType.number,
                textController: passwordController,
                isPassword: true, // Enable password visibility toggle
              ),
              const CustomButton(text: 'Sign Up')
            ],
          ),
        ),
      ),
    );
  }
}
