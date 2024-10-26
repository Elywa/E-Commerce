import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain/Entities/auth_response_entity/failures_entity.dart';
import 'package:e_commerce/Domain/Entities/category_response_entity/category_response_entity.dart';

abstract class HomeTabRemoteDataSource {
  Future<Either<FailuresEntity, CategoryResponseEntity>> getCategories();
}
