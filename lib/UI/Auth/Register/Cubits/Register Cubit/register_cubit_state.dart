part of 'register_cubit_cubit.dart';

@immutable
sealed class RegisterCubitState {}

final class RegisterCubitInitial extends RegisterCubitState {}

final class RegisterCubitLoading extends RegisterCubitState {}

final class RegisterCubSuccess extends RegisterCubitState {}

final class RegisterCubitFailure extends RegisterCubitState {}
