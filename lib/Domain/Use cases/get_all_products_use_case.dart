import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain/Entities/auth_response_entity/failures_entity.dart';
import 'package:e_commerce/Domain/Entities/products_response_entity/products_response_entity.dart';
import 'package:e_commerce/Domain/Repositories/repositories/home_repo.dart';

class GetAllProductsUseCase {
  HomeRepo homeTabRepo;
  GetAllProductsUseCase({required this.homeTabRepo});

  Future<Either<FailuresEntity, ProductsResponseEntity>> invoke() {
    return homeTabRepo.getProducts();
  }
}
