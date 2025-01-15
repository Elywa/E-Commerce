part of 'favourite_tab_cubit.dart';

class FavouriteTabState {}

class FavouriteTabInitialState extends FavouriteTabState {}

class FavouriteTabLodaingState extends FavouriteTabState {}

class FavouriteTabSuccessState extends FavouriteTabState {
  GetUserWishListProductsResponseEntity getUserWishListProductsResponseEntity;
  FavouriteTabSuccessState(
      {required this.getUserWishListProductsResponseEntity});
}

class FavouriteTabFailureState extends FavouriteTabState {
  final FailuresEntity error;
  FavouriteTabFailureState({required this.error});
}
