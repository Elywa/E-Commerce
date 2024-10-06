import 'package:dartz/dartz.dart';
import 'package:e_commerce/Data/Api/api_manager.dart';
import 'package:e_commerce/Domain/Entities/auth_response_entity/auth_result_entity.dart';
import 'package:e_commerce/Domain/Entities/auth_response_entity/failures_entity.dart';
import 'package:e_commerce/Domain/Repositories/data%20source/auth_remote_data_source.dart';
import 'package:e_commerce/Domain/Repositories/repositories/auth_repo.dart';

class AuthRepoImpl implements  AuthRepository{
  @override
  Future<Either<FailuresEntity, AuthResultEntity>> register(String name, String email, String password, String rePassword, String phone) {
   
  }
  
}
