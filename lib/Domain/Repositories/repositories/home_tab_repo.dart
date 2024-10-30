import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain/Entities/auth_response_entity/failures_entity.dart';
import 'package:e_commerce/Domain/Entities/category_or_brands_response_entity/category_or_brands_response_entity.dart';
import 'package:e_commerce/Domain/Entities/products_response_entity/products_response_entity.dart';

abstract class HomeTabRepo {
  Future<Either<FailuresEntity, CategoryOrBrandsResponseEntity>>
      getCategories();

  Future<Either<FailuresEntity, CategoryOrBrandsResponseEntity>> getBrands();
  Future<Either<FailuresEntity, ProductsResponseEntity>> getProducts();
}
