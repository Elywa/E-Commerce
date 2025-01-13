import 'package:dartz/dartz.dart';
import 'package:e_commerce/Data/Api/api_manager.dart';
import 'package:e_commerce/Domain/Entities/add_product_to_favourite_response_entity/add_product_to_favourite_response_entity.dart';
import 'package:e_commerce/Domain/Entities/auth_response_entity/failures_entity.dart';
import 'package:e_commerce/Domain/Repositories/data%20source/favourite_remote_data_source.dart';

class FavouriteRemoteDataSourceImpl implements FavouriteRemoteDataSource {
  ApiManager apiManager;
  FavouriteRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<Either<FailuresEntity, AddProductToFavouriteResponseEntity>>
      addProductToFavourite(String productId) async {
    var either = await apiManager.addProductToFavourite(productId);
    return either.fold((failure) {
      return left(failure);
    }, (success) {
      return right(success);
    });
  }
}
