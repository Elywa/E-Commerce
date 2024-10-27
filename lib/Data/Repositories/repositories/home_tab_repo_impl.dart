import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain/Entities/auth_response_entity/failures_entity.dart';
import 'package:e_commerce/Domain/Entities/category_or_brands_response_entity/category_or_brands_response_entity.dart';
import 'package:e_commerce/Domain/Repositories/data%20source/home_tab_remote_data_source.dart';
import 'package:e_commerce/Domain/Repositories/repositories/home_tab_repo.dart';

class HomeTabRepoImpl implements HomeTabRepo {
  HomeTabRemoteDataSource homeTabRemoteDataSource;
  HomeTabRepoImpl({required this.homeTabRemoteDataSource});
  @override
  Future<Either<FailuresEntity, CategoryOrBrandsResponseEntity>>
      getCategories() {
    return homeTabRemoteDataSource.getCategories();
    // return either.fold((failure) {
    //   return left(failure);
    // }, (categories) {
    //   return right(categories);
    // });
  }

  @override
  Future<Either<FailuresEntity, CategoryOrBrandsResponseEntity>> getBrands() {
    return homeTabRemoteDataSource.getBrands();
  }
}
