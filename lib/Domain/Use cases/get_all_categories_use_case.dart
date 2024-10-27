import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain/Entities/auth_response_entity/failures_entity.dart';
import 'package:e_commerce/Domain/Entities/category_response_entity/category_response_entity.dart';
import 'package:e_commerce/Domain/Repositories/repositories/home_tab_repo.dart';

class GetAllCategoriesUseCase {
  HomeTabRepo homeTabRepo;
  GetAllCategoriesUseCase({required this.homeTabRepo});

  Future<Either<FailuresEntity, CategoryResponseEntity>> invoke() {
    return homeTabRepo.getCategories();
  }
}
