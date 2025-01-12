import 'package:dartz/dartz.dart';
import 'package:e_commerce/Data/Repositories/data%20source/cart_remote_data_source_impl.dart';
import 'package:e_commerce/Domain/Entities/auth_response_entity/failures_entity.dart';
import 'package:e_commerce/Domain/Entities/get_cart_response_entity/get/get.cart.response.entity.dart';
import 'package:e_commerce/Domain/Repositories/repositories/cart_repo.dart';

class CartRepoImpl implements CartRepo {
  CartRemoteDataSourceImpl cartRemoteDataSourceImpl;
  CartRepoImpl({required this.cartRemoteDataSourceImpl});
  @override
  Future<Either<FailuresEntity, GetCartResponseEntity>> getCartProducts() {
    return cartRemoteDataSourceImpl.getCartProducts();
  }
  
  @override
  Future<Either<FailuresEntity, GetCartResponseEntity>> deleteCartProduct() {
    // TODO: implement deleteCartProduct
    throw UnimplementedError();
  }
}
