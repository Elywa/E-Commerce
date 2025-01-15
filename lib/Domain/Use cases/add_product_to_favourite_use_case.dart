import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain/Entities/add_product_to_favourite_response_entity/add_product_to_favourite_response_entity.dart';
import 'package:e_commerce/Domain/Entities/auth_response_entity/failures_entity.dart';

import 'package:e_commerce/Domain/Repositories/repositories/home_repo.dart';

class AddProductToFavouriteUseCase {
  HomeRepo homeRepo;
  AddProductToFavouriteUseCase({required this.homeRepo});
  Future<Either<FailuresEntity, AddProductToFavouriteResponseEntity>> invoke(
      String productId) {
    return homeRepo.addProductToFavourite(productId);
  }
}
