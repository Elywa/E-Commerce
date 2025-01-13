part of 'cart_products_cubit.dart';

abstract class CartProductsState {}

class GetCartProductsInitial extends CartProductsState {}

class GetCartProductsLoading extends CartProductsState {}

class GetCartProductsSuccess extends CartProductsState {
  final GetCartResponseEntity cartProducts;
  GetCartProductsSuccess({required this.cartProducts});
}

class GetCartProductsFailure extends CartProductsState {
  final FailuresEntity error;
  GetCartProductsFailure({required this.error});
}

class DeleteCartProductLoading extends CartProductsState {}

class DeleteCartProductSuccess extends CartProductsState {
  final GetCartResponseEntity cartProducts;
  DeleteCartProductSuccess({required this.cartProducts});
}

class DeleteCartProductFailure extends CartProductsState {
  final FailuresEntity error;
  DeleteCartProductFailure({required this.error});
}

class UpdateCartProductLoading extends CartProductsState {}

class UpdateCartProductSuccess extends CartProductsState {
  final GetCartResponseEntity cartProducts;
  UpdateCartProductSuccess({required this.cartProducts});
}

class UpdateCartProductFailure extends CartProductsState {
  final FailuresEntity error;
  UpdateCartProductFailure({required this.error});
}
