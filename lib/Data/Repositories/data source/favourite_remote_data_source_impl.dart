import 'package:dartz/dartz.dart';
import 'package:e_commerce/Data/Api/api_manager.dart';
import 'package:e_commerce/Domain/Entities/auth_response_entity/failures_entity.dart';
import 'package:e_commerce/Domain/Entities/get_user_wishlist_products_response_entity/get_user_wish_list_products_response_entity/get_user_wish_list_products_response_entity.dart';
import 'package:e_commerce/Domain/Repositories/data%20source/favourite_remote_data_source.dart';

class FavouriteRemoteDataSourceImpl implements FavouriteRemoteDataSource {
  ApiManager apiManager;
  FavouriteRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<Either<FailuresEntity, GetUserWishListProductsResponseEntity>>
      getWishListProducts() async {
    var either = await apiManager.getWishListProducts();
    return either.fold((failure) {
      return left(failure);
    }, (success) {
      return right(success);
    });
  }
}
