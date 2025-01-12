import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain/Entities/auth_response_entity/failures_entity.dart';
import 'package:e_commerce/Domain/Entities/get_cart_response_entity/get/get.cart.response.entity.dart';
import 'package:e_commerce/Domain/Repositories/repositories/cart_repo.dart';

class DeleteCartProductUseCase {
  final CartRepo cartRepo;
  DeleteCartProductUseCase({required this.cartRepo});

  Future<Either<FailuresEntity, GetCartResponseEntity>> invoke(
      String productId) {
    return cartRepo.deleteCartProduct(productId);
  }
}
