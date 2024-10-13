import 'package:dartz/dartz.dart';
import 'package:e_commerce/Data/Api/api_manager.dart';
import 'package:e_commerce/Domain/Entities/auth_response_entity/auth_result_entity.dart';
import 'package:e_commerce/Domain/Entities/auth_response_entity/failures_entity.dart';
import 'package:e_commerce/Domain/Repositories/data%20source/auth_remote_data_source.dart';
import 'package:e_commerce/Domain/Repositories/repositories/auth_repo.dart';

class AuthRepoImpl implements AuthRepository {
  AuthRemoteDataSource dataSource;
  AuthRepoImpl({required this.dataSource});
  @override
  Future<Either<FailuresEntity, AuthResultEntity>> register(String name,
      String email, String password, String rePassword, String phone) async {
    var either =
        await dataSource.register(name, email, password, rePassword, phone);

    return either.fold((failure) {
      return left(failure);
    }, (response) {
      return right(response);
    });
  }

  @override
  Future<Either<FailuresEntity, AuthResultEntity>> login(
      String email, String password) {
    return dataSource.login(email, password);
  }
}
