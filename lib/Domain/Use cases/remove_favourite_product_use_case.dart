import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain/Entities/auth_response_entity/failures_entity.dart';
import 'package:e_commerce/Domain/Entities/remove_favourite_product_response_entity/remove_favourite_product_response_entity.dart';
import 'package:e_commerce/Domain/Repositories/repositories/favourite_repo.dart';

class RemoveFavouriteProductUseCase {
  FavouriteRepo favouriteRepo;
  RemoveFavouriteProductUseCase({required this.favouriteRepo});

  Future<Either<FailuresEntity, RemoveFavouriteProductResponseEntity>> invoke(
      String productId) {
    return favouriteRepo.removeFavouriteProduct(productId);
  }
}
