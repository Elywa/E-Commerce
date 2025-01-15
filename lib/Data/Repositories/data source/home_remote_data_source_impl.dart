import 'package:dartz/dartz.dart';
import 'package:e_commerce/Data/Api/api_manager.dart';
import 'package:e_commerce/Domain/Entities/add_product_response_entity/add_cart_response_entity.dart';
import 'package:e_commerce/Domain/Entities/add_product_to_favourite_response_entity/add_product_to_favourite_response_entity.dart';
import 'package:e_commerce/Domain/Entities/auth_response_entity/failures_entity.dart';
import 'package:e_commerce/Domain/Entities/category_or_brands_response_entity/category_or_brands_response_entity.dart';
import 'package:e_commerce/Domain/Entities/products_response_entity/products_response_entity.dart';
import 'package:e_commerce/Domain/Repositories/data%20source/home_remote_data_source.dart';

class HomeTabRemoteDataSourceImpl implements HomeRemoteDataSource {
  ApiManager apiManager;
  HomeTabRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<FailuresEntity, CategoryOrBrandsResponseEntity>>
      getCategories() async {
    var either = await apiManager.getAllCategories();
    return either.fold((failure) {
      return left(failure);
    }, (categories) {
      return right(categories);
    });
  }

  @override
  Future<Either<FailuresEntity, CategoryOrBrandsResponseEntity>>
      getBrands() async {
    var either = await apiManager.getAllBrands();
    return either.fold((failure) {
      return left(failure);
    }, (brands) {
      return right(brands);
    });
  }

  @override
  Future<Either<FailuresEntity, ProductsResponseEntity>> getProducts() async {
    var either = await apiManager.getProducts();
    return either.fold((failure) {
      return left(failure);
    }, (products) {
      return right(products);
    });
  }

  @override
  Future<Either<FailuresEntity, AddCartResponseEntity>> addCartProduct(
      String productId) async {
    var either = await apiManager.addToCart(productId);
    return either.fold((failure) {
      return left(failure);
    }, (response) {
      return right(response);
    });
  }
   @override
  Future<Either<FailuresEntity, AddProductToFavouriteResponseEntity>>
      addProductToFavourite(String productId) async {
    var either = await apiManager.addProductToFavourite(productId);
    return either.fold((failure) {
      return left(failure);
    }, (success) {
      return right(success);
    });
  }
}
