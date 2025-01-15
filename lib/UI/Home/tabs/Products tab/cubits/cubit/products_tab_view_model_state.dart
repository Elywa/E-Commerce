part of 'products_tab_view_model_cubit.dart';

abstract class ProductsTabViewModelState {
  const ProductsTabViewModelState();
}

class ProductsTabViewModelInitialState extends ProductsTabViewModelState {}

class ProductsTabViewModelLoadingState extends ProductsTabViewModelState {}

class ProductsTabViewModelSuccessState extends ProductsTabViewModelState {
  final ProductsResponseEntity productsResponseEntity;
  ProductsTabViewModelSuccessState({required this.productsResponseEntity});
}

class ProductsTabViewModelFailureState extends ProductsTabViewModelState {
  FailuresEntity? errorMessage;
  ProductsTabViewModelFailureState({required this.errorMessage});
}

class AddProductToCartLoadingState extends ProductsTabViewModelState {}

class AddProductToCartSuccessState extends ProductsTabViewModelState {
  final AddCartResponseEntity addProductResponseEntity;
  AddProductToCartSuccessState({required this.addProductResponseEntity});
}

class AddProductToCartFailureState extends ProductsTabViewModelState {
  FailuresEntity? errorMessage;
  AddProductToCartFailureState({required this.errorMessage});
}

class FavouriteTabLoading extends ProductsTabViewModelState {}

class FavouriteTabSuccess extends ProductsTabViewModelState {
  final AddProductToFavouriteResponseEntity addProductToFavouriteResponseEntity;
  FavouriteTabSuccess({required this.addProductToFavouriteResponseEntity});
}

class FavouriteTabFailure extends ProductsTabViewModelState {
  FailuresEntity? error;
  FavouriteTabFailure({required this.error});
}
