import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain/Entities/auth_response_entity/auth_result_entity.dart';
import 'package:e_commerce/Domain/Entities/auth_response_entity/failures_entity.dart';

abstract class AuthRepository {
  Future<Either<FailuresEntity, AuthResultEntity>> register(String name,
      String email, String password, String rePassword, String phone);
}
