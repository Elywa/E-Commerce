import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain/Entities/auth_response_entity/failures_entity.dart';
import 'package:e_commerce/Domain/Entities/get_user_wishlist_products_response_entity/get_user_wish_list_products_response_entity/get_user_wish_list_products_response_entity.dart';
import 'package:e_commerce/Domain/Repositories/repositories/favourite_repo.dart';

class GetUserWishListProductsUseCase {
  FavouriteRepo favouriteRepo;
  GetUserWishListProductsUseCase({required this.favouriteRepo});

  Future<Either<FailuresEntity, GetUserWishListProductsResponseEntity>>
      invoke() {
    return favouriteRepo.getWishListProducts();
  }
}
