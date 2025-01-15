import 'package:bloc/bloc.dart';
import 'package:e_commerce/Domain/Entities/auth_response_entity/failures_entity.dart';
import 'package:e_commerce/Domain/Entities/get_user_wishlist_products_response_entity/get_user_wish_list_products_response_entity/get_user_wish_list_products_response_entity.dart';
import 'package:e_commerce/Domain/Entities/get_user_wishlist_products_response_entity/get_user_wish_list_products_response_entity/wish_list_product_entity.dart';
import 'package:e_commerce/Domain/Entities/remove_favourite_product_response_entity/remove_favourite_product_response_entity.dart';
import 'package:e_commerce/Domain/Use%20cases/get_user_wish_list_products_use_case.dart';
import 'package:e_commerce/Domain/Use%20cases/remove_favourite_product_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favourite_tab_state.dart';

class FavouriteTabCubit extends Cubit<FavouriteTabState> {
  FavouriteTabCubit(
      this.getUserWishListProductsUseCase, this.removeFavouriteProductUseCase)
      : super(FavouriteTabInitialState());
  List<WishListProductEntity> favouriteList = [];
  GetUserWishListProductsUseCase getUserWishListProductsUseCase;
  RemoveFavouriteProductUseCase removeFavouriteProductUseCase;

  static FavouriteTabCubit get(context) => BlocProvider.of(context);

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
      // Remove the product from the favouriteList
      favouriteList.removeWhere((product) => product.id == productId);

      // Emit a success state with the updated list
      emit(FavouriteTabSuccessState(
        getUserWishListProductsResponseEntity:
            GetUserWishListProductsResponseEntity(
          data: favouriteList,
        ),
      ));
    });
  }
}
