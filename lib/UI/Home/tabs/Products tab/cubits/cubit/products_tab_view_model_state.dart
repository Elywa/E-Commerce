part of 'products_tab_view_model_cubit.dart';

abstract class ProductsTabViewModelState {
  const ProductsTabViewModelState();
}

class ProductsTabViewModelInitialState extends ProductsTabViewModelState {}

class ProductsTabViewModelLoadingState extends ProductsTabViewModelState {}

class ProductsTabViewModelSuccessState extends ProductsTabViewModelState {
  final ProductsResponseEntity productsList;
  ProductsTabViewModelSuccessState({required this.productsList});
}

class ProductsTabViewModelFailureState extends ProductsTabViewModelState {
  final String errorMessage;
  ProductsTabViewModelFailureState({required this.errorMessage});
}
