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

class DeleteFavouriteProductLoading extends FavouriteTabState {}

class DeleteFavouriteProductSuccess extends FavouriteTabState {
  final RemoveFavouriteProductResponseEntity cartProducts;
  DeleteFavouriteProductSuccess({required this.cartProducts});
}

class DeleteFavouriteProductFailure extends FavouriteTabState {
  final FailuresEntity error;
  DeleteFavouriteProductFailure({required this.error});
}
