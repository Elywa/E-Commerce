part of 'register_cubit_cubit.dart';

class RegisterCubitState {}

class RegisterCubitInitial extends RegisterCubitState {}

class RegisterCubitLoading extends RegisterCubitState {}

class RegisterCubSuccess extends RegisterCubitState {
  AuthResultEntity response;
  RegisterCubSuccess({required this.response});
}

class RegisterCubitFailure extends RegisterCubitState {
  final String errMessage;
  RegisterCubitFailure({required this.errMessage});
}
