import 'package:e_commerce/Domain/Use%20cases/login_use_case.dart';
import 'package:e_commerce/UI/Auth/Login/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginUseCase}) : super(LoginInitialState());
  LoginUseCase loginUseCase;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void login() async {
    emit(LoginLoadingState());
    var either = await loginUseCase.invoke(
        emailController.text, passwordController.text);

    either.fold((failure) {
      emit(LoginFailureState(errMessage: failure.errMessage!));
    }, (response) {
      emit(LoginSuccessState(authResultEntity: response));
    });
  }
}
