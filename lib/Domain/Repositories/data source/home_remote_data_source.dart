import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain/Entities/add_product_response_entity/add_cart_response_entity.dart';
import 'package:e_commerce/Domain/Entities/add_product_to_favourite_response_entity/add_product_to_favourite_response_entity.dart';
import 'package:e_commerce/Domain/Entities/auth_response_entity/failures_entity.dart';
import 'package:e_commerce/Domain/Entities/category_or_brands_response_entity/category_or_brands_response_entity.dart';
import 'package:e_commerce/Domain/Entities/products_response_entity/products_response_entity.dart';

abstract class HomeRemoteDataSource {
  Future<Either<FailuresEntity, CategoryOrBrandsResponseEntity>>
      getCategories();

  Future<Either<FailuresEntity, CategoryOrBrandsResponseEntity>> getBrands();
  Future<Either<FailuresEntity, ProductsResponseEntity>> getProducts();
  Future<Either<FailuresEntity, AddCartResponseEntity>> addCartProduct(
      String productId);
  Future<Either<FailuresEntity, AddProductToFavouriteResponseEntity>>
      addProductToFavourite(String productId);
}
