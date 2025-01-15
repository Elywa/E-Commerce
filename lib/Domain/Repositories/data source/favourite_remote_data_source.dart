import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain/Entities/auth_response_entity/failures_entity.dart';
import 'package:e_commerce/Domain/Entities/get_user_wishlist_products_response_entity/get_user_wish_list_products_response_entity/get_user_wish_list_products_response_entity.dart';
import 'package:e_commerce/Domain/Entities/remove_favourite_product_response_entity/remove_favourite_product_response_entity.dart';

abstract class FavouriteRemoteDataSource {
  Future<Either<FailuresEntity, GetUserWishListProductsResponseEntity>>
      getWishListProducts();

  Future<Either<FailuresEntity, RemoveFavouriteProductResponseEntity>>
      removeFavouriteProduct(String productId);
}
