// view model => use Case
// use case => repositories
// repository => data source
// data source => api manager

import 'package:e_commerce/Data/Api/api_manager.dart';
import 'package:e_commerce/Data/Repositories/data%20source/auth_remote_data_source_impl.dart';
import 'package:e_commerce/Data/Repositories/data%20source/home_tab_remote_data_source_impl.dart';
import 'package:e_commerce/Data/Repositories/repositories/auth_repo_impl.dart';
import 'package:e_commerce/Data/Repositories/repositories/home_tab_repo_impl.dart';
import 'package:e_commerce/Domain/Repositories/data%20source/auth_remote_data_source.dart';
import 'package:e_commerce/Domain/Repositories/data%20source/home_tab_remote_data_source.dart';
import 'package:e_commerce/Domain/Repositories/repositories/auth_repo.dart';
import 'package:e_commerce/Domain/Repositories/repositories/home_tab_repo.dart';
import 'package:e_commerce/Domain/Use%20cases/get_all_categories_use_case.dart';
import 'package:e_commerce/Domain/Use%20cases/get_all_products_use_case.dart';
import 'package:e_commerce/Domain/Use%20cases/get_brands_use_case.dart';
import 'package:e_commerce/Domain/Use%20cases/login_use_case.dart';
import 'package:e_commerce/Domain/Use%20cases/register_use_case.dart';

RegisterUseCase injectRegisterUseCase() {
  return RegisterUseCase(authRepository: injectAuthRepository());
}

GetAllProductsUseCase injectGetAllProductsUseCase() {
  return GetAllProductsUseCase(homeTabRepo: injectHomeTabRepo());
}

GetBrandsUseCase injectBrandsUseCase() {
  return GetBrandsUseCase(homeTabRepo: injectHomeTabRepo());
}

AuthRepository injectAuthRepository() {
  return AuthRepoImpl(dataSource: injectAuthRemoteDataSource());
}

GetAllCategoriesUseCase injectGetAllCategoriesUseCase() {
  return GetAllCategoriesUseCase(homeTabRepo: injectHomeTabRepo());
}

HomeTabRepo injectHomeTabRepo() {
  return HomeTabRepoImpl(
      homeTabRemoteDataSource: injectHomeTabRemoteDataSorce());
}

HomeTabRemoteDataSource injectHomeTabRemoteDataSorce() {
  return HomeTabRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}

LoginUseCase injectLoginUseCase() {
  return LoginUseCase(authrepo: injectAuthRepository());
}

AuthRemoteDataSource injectAuthRemoteDataSource() {
  return AuthRemoteDataSourceImpl(api: ApiManager.getInstance());
}
