import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain/Entities/auth_response_entity/failures_entity.dart';
import 'package:e_commerce/Domain/Entities/get_cart_response_entity/get/get.cart.response.entity.dart';
import 'package:e_commerce/Domain/Repositories/repositories/cart_repo.dart';

class UpdateCartProductUseCase {
  final CartRepo cartRepo;
  UpdateCartProductUseCase({required this.cartRepo});

  Future<Either<FailuresEntity, GetCartResponseEntity>> invoke(
      String productId, int count) {
    return cartRepo.updateCartProduct(productId, count);
  }
}
