import 'package:dartz/dartz.dart';
import 'package:e_commerce/Data/Api/api_manager.dart';
import 'package:e_commerce/Domain/Entities/auth_response_entity/auth_result_entity.dart';
import 'package:e_commerce/Domain/Entities/auth_response_entity/failures_entity.dart';
import 'package:e_commerce/Domain/Repositories/data%20source/auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiManager api;
  AuthRemoteDataSourceImpl({required this.api});
  @override
  Future<Either<FailuresEntity, AuthResultEntity>> register(String name,
      String email, String password, String rePassword, String phone) async {
    var either = await api.register(name, email, password, rePassword, phone);

    return either.fold((failure) {
      return left(failure);
    }, (response) {
      return right(response.toAuthResultEntity());
    });
  }
}
