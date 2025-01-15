import 'package:dartz/dartz.dart';
import 'package:e_commerce/Data/Repositories/data%20source/favourite_remote_data_source_impl.dart';
import 'package:e_commerce/Domain/Entities/auth_response_entity/failures_entity.dart';
import 'package:e_commerce/Domain/Entities/get_user_wishlist_products_response_entity/get_user_wish_list_products_response_entity/get_user_wish_list_products_response_entity.dart';
import 'package:e_commerce/Domain/Repositories/repositories/favourite_repo.dart';

class FavouriteRepoImpl implements FavouriteRepo {
  FavouriteRemoteDataSourceImpl favouriteRemoteDataSourceImpl;
  FavouriteRepoImpl({required this.favouriteRemoteDataSourceImpl});
  @override
  Future<Either<FailuresEntity, GetUserWishListProductsResponseEntity>>
      getWishListProducts() {
    return favouriteRemoteDataSourceImpl.getWishListProducts();
  }
}
