import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain/Entities/auth_response_entity/auth_result_entity.dart';
import 'package:e_commerce/Domain/Entities/auth_response_entity/failures_entity.dart';
import 'package:e_commerce/Domain/Repositories/repositories/auth_repo.dart';

class LoginUseCase {
  AuthRepository authrepo;

  LoginUseCase({required this.authrepo});

  Future<Either<FailuresEntity, AuthResultEntity>> invoke(
      String email, String password) {
    return authrepo.login(email, password);
  }
}
