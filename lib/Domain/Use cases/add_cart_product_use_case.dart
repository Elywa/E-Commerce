import 'package:dartz/dartz.dart';
import 'package:e_commerce/Data/Model/response/add_cart_response_dto/add_cart_response_dto.dart';
import 'package:e_commerce/Domain/Entities/add_product_response_entity/add_cart_response_entity.dart';
import 'package:e_commerce/Domain/Entities/auth_response_entity/failures_entity.dart';
import 'package:e_commerce/Domain/Entities/products_response_entity/products_response_entity.dart';
import 'package:e_commerce/Domain/Repositories/repositories/home_repo.dart';

class AddCartProductUseCase {
  HomeRepo homeTabRepo;
  AddCartProductUseCase({required this.homeTabRepo});
  Future<Either<FailuresEntity, AddCartResponseEntity>> invoke(
      String productId) {
    return homeTabRepo.addCartProduct(productId);
  }
}
