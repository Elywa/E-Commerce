part of 'register_cubit_cubit.dart';

@immutable
sealed class RegisterCubitState {}

final class RegisterCubitInitial extends RegisterCubitState {}

final class RegisterCubitLoading extends RegisterCubitState {}

final class RegisterCubSuccess extends RegisterCubitState {
  AuthResultEntity response;
  RegisterCubSuccess({required this.response});
}

final class RegisterCubitFailure extends RegisterCubitState {
  final String errMessage;
  RegisterCubitFailure({required this.errMessage});
}
