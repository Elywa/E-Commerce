part of 'get_cart_products_cubit.dart';

abstract class GetCartProductsState {}

class GetCartProductsInitial extends GetCartProductsState {}

class GetCartProductsSuccess extends GetCartProductsState {
  final List<GetCartResponseEntity> cartProducts;
  GetCartProductsSuccess({required this.cartProducts});
}

class GetCartProductsFailure extends GetCartProductsState {
  final FailuresEntity error;
  GetCartProductsFailure({required this.error});
}
