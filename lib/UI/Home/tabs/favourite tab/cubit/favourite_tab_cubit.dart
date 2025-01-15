import 'package:bloc/bloc.dart';
import 'package:e_commerce/Domain/Entities/auth_response_entity/failures_entity.dart';
import 'package:e_commerce/Domain/Entities/get_user_wishlist_products_response_entity/get_user_wish_list_products_response_entity/get_user_wish_list_products_response_entity.dart';
import 'package:e_commerce/Domain/Entities/get_user_wishlist_products_response_entity/get_user_wish_list_products_response_entity/wish_list_product_entity.dart';
import 'package:e_commerce/Domain/Entities/remove_favourite_product_response_entity/remove_favourite_product_response_entity.dart';
import 'package:e_commerce/Domain/Use%20cases/get_user_wish_list_products_use_case.dart';
import 'package:e_commerce/Domain/Use%20cases/remove_favourite_product_use_case.dart';
import 'package:equatable/equatable.dart';

part 'favourite_tab_state.dart';

class FavouriteTabCubit extends Cubit<FavouriteTabState> {
  FavouriteTabCubit(
      this.getUserWishListProductsUseCase, this.removeFavouriteProductUseCase)
      : super(FavouriteTabInitialState());
  List<WishListProductEntity> favouriteList = [];
  GetUserWishListProductsUseCase getUserWishListProductsUseCase;
  RemoveFavouriteProductUseCase removeFavouriteProductUseCase;
  void getUserWishListProducts() async {
    emit(FavouriteTabLodaingState());
    var response = await getUserWishListProductsUseCase.invoke();
    response.fold((failure) {
      emit(FavouriteTabFailureState(error: failure));
    }, (success) {
      favouriteList = success.data ?? [];
      emit(FavouriteTabSuccessState(
          getUserWishListProductsResponseEntity: success));
    });
  }

  void deleteFavouriteProduct(String productId) async {
    emit(DeleteFavouriteProductLoading());
    var response = await removeFavouriteProductUseCase.invoke(productId);
    response.fold((failure) {
      emit(DeleteFavouriteProductFailure(error: failure));
    }, (success) {
      emit(DeleteFavouriteProductSuccess(cartProducts: success));
    });
  }
}
