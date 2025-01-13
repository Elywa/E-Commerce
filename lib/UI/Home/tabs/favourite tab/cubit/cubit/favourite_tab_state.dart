part of 'favourite_tab_cubit.dart';

class FavouriteTabState {}

class FavouriteTabInitial extends FavouriteTabState {}

class FavouriteTabLoading extends FavouriteTabState {}

class FavouriteTabSuccess extends FavouriteTabState {
  final AddProductToFavouriteResponseEntity addProductToFavouriteResponseEntity;
  FavouriteTabSuccess({required this.addProductToFavouriteResponseEntity});
}

class FavouriteTabFailure extends FavouriteTabState {
  final FailuresEntity error;
  FavouriteTabFailure({required this.error});
}
