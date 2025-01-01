import 'package:e_commerce/Domain/di.dart';
import 'package:e_commerce/UI/Auth/Register/Cubits/Register%20Cubit/register_cubit_cubit.dart';
import 'package:e_commerce/UI/Home/Home_View.dart';
import 'package:e_commerce/UI/Utils/shared%20widgets/Custom_Button.dart';
import 'package:e_commerce/UI/Utils/shared%20widgets/Route_Title.dart';
import 'package:e_commerce/UI/Utils/shared%20widgets/text_form_field.dart';
import 'package:e_commerce/UI/Utils/shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  RegisterCubit viewModel =
      RegisterCubit(registerUseCase: injectRegisterUseCase());
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: BlocListener(
          bloc: viewModel,
          listener: (context, state) {
            if (state is RegisterCubitLoading) {
              isLoading = true;
              debugPrint(
                  'Loading=============================================');
              // showDialog(
              //     context: context,
              //     builder: (context) {
              //       return const Center(child: CircularProgressIndicator());
              //     });
            } else if (state is RegisterCubSuccess) {
              isLoading = false;
              debugPrint(
                  'Success =============================================');
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Register Success'),
                ),
              );
              MySharedPrefrence.saveData(
                  key: 'Token', value: state.response.token);
              Navigator.pushReplacementNamed(context, HomeView.homeViewId);
            } else if (state is RegisterCubitFailure) {
              isLoading = false;
              debugPrint(state.errMessage);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errMessage),
                ),
              );
              // return Fluttertoast.showToast(msg: state.errMessage);
            }
          },
          child: SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: viewModel.formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    TextFieldItem(
                      hintText: 'enter your full name',
                      label: 'Full Name',
                      textController: viewModel.fullNameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Name is required';
                        }
                      },
                    ),
                    TextFieldItem(
                      hintText: 'enter your phone number',
                      label: 'Phone Number',
                      keyboardTupe: TextInputType.number,
                      textController: viewModel.phoneNumberController,
                      validator: (value) {
                        if (value!.length < 11) {
                          return "Not Valid Phone Number";
                        }
                        return null;
                      },
                    ),
                    TextFieldItem(
                      hintText: 'Enter your email address',
                      label: 'Email',
                      textController: viewModel.emailController,
                      validator: (value) {
                        RegExp regex = RegExp(
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                        if (value!.isEmpty) {
                          return 'Please enter your email address';
                        } else {
                          if (!regex.hasMatch(value)) {
                            return 'Please enter a valid email address';
                          } else {
                            return null;
                          }
                        }
                      },
                    ),
                    TextFieldItem(
                      hintText: 'enter your password',
                      label: 'Password',

                      textController: viewModel.passwordController,
                      isPassword: true,
                      validator: (value) {
                        if (value!.length < 8) {
                          return "Password must be more than 8 chars";
                        }
                        return null;
                      },
                      // Enable password visibility toggle
                    ),
                    TextFieldItem(
                      hintText: 'confirm password',
                      label: 'Confirm password',
                      // keyboardTupe: TextInputType.number,
                      textController: viewModel.confirmPasswordController,
                      isPassword: true,
                      validator: (value) {
                        if (value!.length < 8 &&
                            value != viewModel.passwordController.text) {
                          return "Password don't match";
                        }
                        return null;
                      },
                      // Enable password visibility toggle
                    ),
                    CustomButton(
                      text: 'Sign Up',
                      onPressed: () {
                        viewModel.register();
                      },
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
