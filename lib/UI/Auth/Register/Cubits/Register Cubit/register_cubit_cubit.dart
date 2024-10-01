import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'register_cubit_state.dart';

class RegisterCubit extends Cubit<RegisterCubitState> {
  RegisterCubit() : super(RegisterCubitInitial());
// handle logic - hold data
  TextEditingController fullNameController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void register() {}
}
