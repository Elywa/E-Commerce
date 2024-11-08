import 'package:dartz/dartz.dart';
import 'package:e_commerce/Data/Model/response/add_product_response_dto/add_product_response_dto.dart';
import 'package:e_commerce/Domain/Entities/add_product_response_entity/add_product_response_entity.dart';
import 'package:e_commerce/Domain/Entities/auth_response_entity/failures_entity.dart';
import 'package:e_commerce/Domain/Entities/products_response_entity/products_response_entity.dart';
import 'package:e_commerce/Domain/Repositories/repositories/home_tab_repo.dart';

class AddCartProductUseCase {
  HomeTabRepo homeTabRepo;
  AddCartProductUseCase({required this.homeTabRepo});
  Future<Either<FailuresEntity, AddProductResponseEntity>> invoke(String productId) {
    return homeTabRepo.addCartProduct(productId);
  }
}
