import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain/Entities/auth_response_entity/failures_entity.dart';
import 'package:e_commerce/Domain/Entities/category_or_brands_response_entity/category_or_brands_response_entity.dart';
import 'package:e_commerce/Domain/Repositories/repositories/home_repo.dart';

class GetAllCategoriesUseCase {
  HomeRepo homeTabRepo;
  GetAllCategoriesUseCase({required this.homeTabRepo});

  Future<Either<FailuresEntity, CategoryOrBrandsResponseEntity>> invoke() {
    return homeTabRepo.getCategories();
  }
}
