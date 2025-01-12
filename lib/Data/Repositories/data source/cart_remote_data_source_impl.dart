import 'package:dartz/dartz.dart';
import 'package:e_commerce/Data/Api/api_manager.dart';
import 'package:e_commerce/Domain/Entities/auth_response_entity/failures_entity.dart';
import 'package:e_commerce/Domain/Entities/get_cart_response_entity/get/get.cart.response.entity.dart';
import 'package:e_commerce/Domain/Repositories/data%20source/cart_romte_data_source.dart';

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  ApiManager apiManager;
  CartRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<Either<FailuresEntity, GetCartResponseEntity>>
      getCartProducts() async {
    var either = await apiManager.getCartProducts();
    return either.fold((failure) {
      return left(failure);
    }, (success) {
      return right(success);
    });
  }
  
  @override
  Future<Either<FailuresEntity, GetCartResponseEntity>> deleteCartProduct() {
    // TODO: implement deleteCartProduct
    throw UnimplementedError();
  }
}
