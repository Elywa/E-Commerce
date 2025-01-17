import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain/Entities/auth_response_entity/failures_entity.dart';
import 'package:e_commerce/Domain/Entities/get_cart_response_entity/get/get.cart.response.entity.dart';

abstract class CartRemoteDataSource {
  Future<Either<FailuresEntity, GetCartResponseEntity>> getCartProducts();
  Future<Either<FailuresEntity, GetCartResponseEntity>> deleteCartProduct(
      String productId);
  Future<Either<FailuresEntity, GetCartResponseEntity>> updateCartProduct(
      String productId, int count);
}
