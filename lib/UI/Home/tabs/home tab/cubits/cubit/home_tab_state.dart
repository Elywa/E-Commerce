part of 'home_tab_cubit.dart';

abstract class HomeTabStates {}

class HomeTabInitialState extends HomeTabStates {}

class HomeTabLoadingState extends HomeTabStates {}

class HomeTabSuccessState extends HomeTabStates {
  CategoryOrBrandsResponseEntity cateories;
  HomeTabSuccessState({required this.cateories});
}

class HomeTabFailureState extends HomeTabStates {
  final FailuresEntity? error;
  HomeTabFailureState({required this.error});
}
