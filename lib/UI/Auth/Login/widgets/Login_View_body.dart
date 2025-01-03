import 'package:e_commerce/Domain/Entities/auth_response_entity/auth_response_entity.dart';
import 'package:e_commerce/Domain/Entities/auth_response_entity/auth_result_entity.dart';
import 'package:e_commerce/Domain/di.dart';
import 'package:e_commerce/UI/Auth/Login/cubit/login_cubit.dart';
import 'package:e_commerce/UI/Auth/Login/cubit/login_state.dart';
import 'package:e_commerce/UI/Auth/Register/register_view.dart';
import 'package:e_commerce/UI/Home/Home_View.dart';
import 'package:e_commerce/UI/Utils/shared%20widgets/Custom_Button.dart';
import 'package:e_commerce/UI/Utils/shared%20widgets/Route_Title.dart';
import 'package:e_commerce/UI/Utils/shared%20widgets/text_form_field.dart';
import 'package:e_commerce/UI/Utils/shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  LoginCubit viewModel = LoginCubit(loginUseCase: injectLoginUseCase());
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: viewModel,
      listener: (context, state) async {
        if (state is LoginLoadingState) {
          isLoading = true;
        } else if (state is LoginSuccessState) {
          isLoading = false;
          // ScaffoldMessenger.of(context).showSnackBar(
          //   const SnackBar(
          //     content: Text('Login Success'),
          //   ),
          // );
          // MySharedPrefrence.saveData(
          //     key: 'Token', value: state.authResultEntity.token);
          // var token = Hive.box<AuthResultEntity>('user');
          // token.put('token', state.authResultEntity.token);
          var box = Hive.box('token');
          box.put('token', state.authResultEntity.token);
          var token = box.get('token');
          // var user = MySharedPrefrence.getData(key: 'Token');

          debugPrint(
              '==============================================   Login Success with token $token=====================');
          Navigator.of(context).pushReplacementNamed(HomeView.homeViewId);
        } else if (state is LoginFailureState) {
          isLoading = false;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
            ),
          );
        }
      },
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: SingleChildScrollView(
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
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .1,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.h),
                    child: Text(
                      'Welcome Back',
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
                    child: CustomButton(
                      text: 'Login',
                      onPressed: () {
                        viewModel.login();
                      },
                    ),
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
        ),
      ),
    );
  }
}
