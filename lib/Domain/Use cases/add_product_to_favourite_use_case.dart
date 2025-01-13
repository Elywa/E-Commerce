import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain/Entities/add_product_to_favourite_response_entity/add_product_to_favourite_response_entity.dart';
import 'package:e_commerce/Domain/Entities/auth_response_entity/failures_entity.dart';
import 'package:e_commerce/Domain/Repositories/repositories/favourite_repo.dart';

class AddProductToFavouriteUseCase {
  FavouriteRepo favouriteRepo;
  AddProductToFavouriteUseCase({required this.favouriteRepo});
  Future<Either<FailuresEntity, AddProductToFavouriteResponseEntity>> invoke(
      String productId) {
    return favouriteRepo.addProductToFavourite(productId);
  }
}
