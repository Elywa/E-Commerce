import 'package:dartz/dartz.dart';
import 'package:e_commerce/Domain/Entities/auth_response_entity/auth_result_entity.dart';
import 'package:e_commerce/Domain/Entities/auth_response_entity/failures.dart';
import 'package:e_commerce/Domain/Repositories/repositories/auth_repo.dart';

class RegisterUseCase {
  AuthRepository authRepository;

  RegisterUseCase({required this.authRepository});

  Future<Either<Failures, AuthResultEntity>> invoke(String name, String email,
      String password, String rePassword, String phone) {
    return authRepository.register(name, email, password, rePassword, phone);
  }
}
