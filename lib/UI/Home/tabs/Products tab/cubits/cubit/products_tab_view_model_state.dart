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
