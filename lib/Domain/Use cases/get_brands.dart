import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain/Entities/auth_response_entity/failures_entity.dart';
import 'package:e_commerce/Domain/Entities/category_or_brands_response_entity/category_or_brands_response_entity.dart';
import 'package:e_commerce/Domain/Repositories/repositories/home_tab_repo.dart';

class GetBrands {
  HomeTabRepo homeTabRepo;
  GetBrands({required this.homeTabRepo});
  Future<Either<FailuresEntity, CategoryOrBrandsResponseEntity>> getBrands() {
    return homeTabRepo.getBrands();
  }
}
