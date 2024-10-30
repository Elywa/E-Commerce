part of 'products_tab_view_model_cubit.dart';

abstract class ProductsTabViewModelState {
  const ProductsTabViewModelState();
}

class ProductsTabViewModelInitialState extends ProductsTabViewModelState {}

class ProductsTabViewModelLoadingState extends ProductsTabViewModelState {}

class ProductsTabViewModelSuccessState extends ProductsTabViewModelState {}

class ProductsTabViewModelFailureState extends ProductsTabViewModelState {}
