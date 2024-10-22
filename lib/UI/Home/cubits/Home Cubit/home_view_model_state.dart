part of 'home_view_model_cubit.dart';

sealed class HomeViewModelState extends Equatable {
  const HomeViewModelState();

  @override
  List<Object> get props => [];
}

final class HomeViewModelInitial extends HomeViewModelState {}
