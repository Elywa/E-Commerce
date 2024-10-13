import 'package:e_commerce/Domain/Entities/auth_response_entity/auth_result_entity.dart';

class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  AuthResultEntity authResultEntity;
  LoginSuccessState({required this.authResultEntity});
}

class LoginFailureState extends LoginState {
  final String errMessage;
  LoginFailureState({required this.errMessage});
}
