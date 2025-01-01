import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain/Entities/add_product_response_entity/add_cart_response_entity.dart';
import 'package:e_commerce/Domain/Entities/auth_response_entity/failures_entity.dart';
import 'package:e_commerce/Domain/Entities/category_or_brands_response_entity/category_or_brands_response_entity.dart';
import 'package:e_commerce/Domain/Entities/products_response_entity/products_response_entity.dart';
import 'package:e_commerce/Domain/Repositories/data%20source/home_remote_data_source.dart';
import 'package:e_commerce/Domain/Repositories/repositories/home_repo.dart';

class HomeTabRepoImpl implements HomeRepo {
  HomeRemoteDataSource homeTabRemoteDataSource;
  HomeTabRepoImpl({required this.homeTabRemoteDataSource});
  @override
  Future<Either<FailuresEntity, CategoryOrBrandsResponseEntity>>
      getCategories() {
    return homeTabRemoteDataSource.getCategories();
  }

  @override
  Future<Either<FailuresEntity, CategoryOrBrandsResponseEntity>> getBrands() {
    return homeTabRemoteDataSource.getBrands();
  }

  @override
  Future<Either<FailuresEntity, ProductsResponseEntity>> getProducts() async {
    return homeTabRemoteDataSource.getProducts();
  }

  @override
  Future<Either<FailuresEntity, AddCartResponseEntity>> addCartProduct(
      String productId) {
    return homeTabRemoteDataSource.addCartProduct(productId);
  }
}
