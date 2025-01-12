import 'package:bloc/bloc.dart';
import 'package:e_commerce/Domain/Entities/auth_response_entity/failures_entity.dart';
import 'package:e_commerce/Domain/Entities/get_cart_response_entity/get/get.cart.response.entity.dart';

import 'package:e_commerce/Domain/Entities/get_cart_response_entity/get/get_product_cart_entity.dart';
import 'package:e_commerce/Domain/Use%20cases/delete_cart_product_use_case.dart';
import 'package:e_commerce/Domain/Use%20cases/get_cart_products_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_cart_products_state.dart';

class GetCartProductsCubit extends Cubit<GetCartProductsState> {
  GetCartProductsCubit(
      this.getCartProductsUseCase, this.deleteCartProductUseCase)
      : super(GetCartProductsInitial());
  List<GetProductCartEntity> cartItems = [];
  final GetCartProductsUseCase getCartProductsUseCase;
  final DeleteCartProductUseCase deleteCartProductUseCase;
  void getCartProducts() async {
    emit(GetCartProductsLoading());

    var response = await getCartProductsUseCase.invoke();
    return response.fold((failure) {
      emit(GetCartProductsFailure(error: failure));
    }, (cartProducts) {
      cartItems = cartProducts.data!.products ?? [];
      emit(GetCartProductsSuccess(cartProducts: cartProducts));
    });
  }

  static GetCartProductsCubit get(context) => BlocProvider.of(context);
 void deleteCartProduct(String productId) async {
  emit(DeleteCartProductLoading());
  final response = await deleteCartProductUseCase.invoke(productId);
  response.fold(
    (failure) {
      emit(DeleteCartProductFailure(error: failure));
    },
    (cartProducts) {
      // Remove the deleted product from the local list
      cartItems.removeWhere((product) => product.product?.id == productId);

      // Emit a success state with the updated cart
      emit(DeleteCartProductSuccess(
        cartProducts: cartProducts,
      ));
    },
  );
}

}
