// view model => use Case
// use case => repositories
// repository => data source
// data source => api manager

import 'package:e_commerce/Data/Api/api_manager.dart';
import 'package:e_commerce/Data/Repositories/data%20source/auth_remote_data_source_impl.dart';
import 'package:e_commerce/Data/Repositories/repositories/auth_repo_impl.dart';
import 'package:e_commerce/Domain/Repositories/data%20source/auth_remote_data_source.dart';
import 'package:e_commerce/Domain/Repositories/repositories/auth_repo.dart';
import 'package:e_commerce/Domain/Use%20cases/login_use_case.dart';
import 'package:e_commerce/Domain/Use%20cases/register_use_case.dart';

RegisterUseCase injectRegisterUseCase() {
  return RegisterUseCase(authRepository: injectAuthRepository());
}

AuthRepository injectAuthRepository() {
  return AuthRepoImpl(dataSource: injectAuthRemoteDataSource());
}

LoginUseCase injectLoginUseCase() {
  return LoginUseCase(authrepo: injectAuthRepository());
}

AuthRemoteDataSource injectAuthRemoteDataSource() {
  return AuthRemoteDataSourceImpl(api: ApiManager.getInstance());
}
