import 'package:dartz/dartz.dart';
import 'package:e_commerce/Data/Repositories/data%20source/favourite_remote_data_source_impl.dart';
import 'package:e_commerce/Domain/Entities/add_product_to_favourite_response_entity/add_product_to_favourite_response_entity.dart';
import 'package:e_commerce/Domain/Entities/auth_response_entity/failures_entity.dart';
import 'package:e_commerce/Domain/Repositories/repositories/favourite_repo.dart';

class FavouriteRepoImpl implements FavouriteRepo {
  FavouriteRemoteDataSourceImpl favouriteRemoteDataSourceImpl;
  FavouriteRepoImpl({required this.favouriteRemoteDataSourceImpl});
  @override
  Future<Either<FailuresEntity, AddProductToFavouriteResponseEntity>>
      addProductToFavourite(String productId) {
    return favouriteRemoteDataSourceImpl.addProductToFavourite(productId);
  }
}
