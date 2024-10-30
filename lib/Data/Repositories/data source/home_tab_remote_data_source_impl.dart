import 'package:dartz/dartz.dart';
import 'package:e_commerce/Data/Api/api_manager.dart';
import 'package:e_commerce/Domain/Entities/auth_response_entity/failures_entity.dart';
import 'package:e_commerce/Domain/Entities/category_or_brands_response_entity/category_or_brands_response_entity.dart';
import 'package:e_commerce/Domain/Entities/products_response_entity/products_response_entity.dart';
import 'package:e_commerce/Domain/Repositories/data%20source/home_tab_remote_data_source.dart';

class HomeTabRemoteDataSourceImpl implements HomeTabRemoteDataSource {
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
}
