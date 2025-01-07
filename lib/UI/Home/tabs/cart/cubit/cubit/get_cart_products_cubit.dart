import 'package:bloc/bloc.dart';
import 'package:e_commerce/Domain/Entities/auth_response_entity/failures_entity.dart';
import 'package:e_commerce/Domain/Entities/get_cart_response_entity/get/get.cart.response.entity.dart';
import 'package:e_commerce/Domain/Entities/get_cart_response_entity/get/get_product_cart_entity.dart';
import 'package:e_commerce/Domain/Use%20cases/get_cart_products_use_case.dart';
import 'package:equatable/equatable.dart';

part 'get_cart_products_state.dart';

class GetCartProductsCubit extends Cubit<GetCartProductsState> {
  GetCartProductsCubit(this.getCartProductsUseCase)
      : super(GetCartProductsInitial());
  final GetCartProductsUseCase getCartProductsUseCase;
  void getCartProducts() {}
}
