import 'package:e_commerce/Domain/di.dart';
import 'package:e_commerce/UI/Auth/Login/cubit/login_cubit.dart';
import 'package:e_commerce/UI/Auth/Register/register_view.dart';
import 'package:e_commerce/UI/Utils/shared%20widgets/Custom_Button.dart';
import 'package:e_commerce/UI/Utils/shared%20widgets/Route_Title.dart';
import 'package:e_commerce/UI/Utils/shared%20widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginViewBody extends StatelessWidget {
  LoginViewBody({super.key});
  LoginCubit viewModel = LoginCubit(loginUseCase: injectLoginUseCase());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Form(
        key: viewModel.formKey,
        child: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 25,
              ),
              const RouteTitle(),
              Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: Text(
                  'Welcome Back To Route',
                  textAlign: TextAlign.start,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 24),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 40.h),
                child: Text(
                  'Please sign in with your mail',
                  textAlign: TextAlign.start,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 16),
                ),
              ),

              // Email TextField with validation
              TextFieldItem(
                hintText: 'Please enter your email',
                label: 'Email',
                validator: (value) {
                  RegExp emailRegex = RegExp(
                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  } else if (!emailRegex.hasMatch(value)) {
                    return 'Please enter a valid email address';
                  } else {
                    return null;
                  }
                },
                textController: viewModel.emailController,
              ),

              // Password TextField with validation
              TextFieldItem(
                hintText: 'Please enter your password',
                label: 'Password',
                isPassword: true,
                keyboardTupe: TextInputType.number,
                validator: (value) {
                  RegExp passwordRegex = RegExp(
                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  } else if (!passwordRegex.hasMatch(value)) {
                    return 'Password should be 8+ chars, incl. uppercase, lowercase, number & symbol';
                  } else {
                    return null;
                  }
                },
                textController: viewModel.passwordController,
              ),

              Padding(
                padding: EdgeInsets.only(right: 15.w),
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot password',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 40.h),
                child: CustomButton(text: 'Login'),
              ),

              Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, RegisterView.registerViewId);
                  },
                  child: Center(
                    child: Text(
                      "Don't have an Account? create one!",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
