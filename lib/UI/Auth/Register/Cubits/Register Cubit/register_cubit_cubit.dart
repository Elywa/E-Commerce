import 'package:bloc/bloc.dart';
import 'package:e_commerce/Domain/Entities/auth_response_entity/auth_result_entity.dart';
import 'package:e_commerce/Domain/Use%20cases/register_use_case.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

part 'register_cubit_state.dart';

class RegisterCubit extends Cubit<RegisterCubitState> {
  RegisterCubit({required this.registerUseCase})
      : super(RegisterCubitInitial());
// handle logic - hold data
  TextEditingController fullNameController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RegisterUseCase registerUseCase;

  void register() async {
    emit(RegisterCubitLoading());

    var either = await registerUseCase.invoke(
        fullNameController.text,
        emailController.text,
        passwordController.text,
        confirmPasswordController.text,
        phoneNumberController.text);

    return either.fold((failure) {
      emit(RegisterCubitFailure(errMessage: failure.errMessage!));
    }, (response) {
      emit(RegisterCubSuccess(response: response));
    });
  }
}
