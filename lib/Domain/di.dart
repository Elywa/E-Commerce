// view model => use Case
// use case => repositories
// repository => data source
// data source => api manager

import 'package:e_commerce/Data/Api/api_manager.dart';
import 'package:e_commerce/Data/Repositories/data%20source/auth_remote_data_source_impl.dart';
import 'package:e_commerce/Data/Repositories/data%20source/cart_remote_data_source_impl.dart';
import 'package:e_commerce/Data/Repositories/data%20source/home_remote_data_source_impl.dart';
import 'package:e_commerce/Data/Repositories/repositories/auth_repo_impl.dart';
import 'package:e_commerce/Data/Repositories/repositories/cart_repo_impl.dart';
import 'package:e_commerce/Data/Repositories/repositories/home_tab_repo_impl.dart';
import 'package:e_commerce/Domain/Repositories/data%20source/auth_remote_data_source.dart';
import 'package:e_commerce/Domain/Repositories/data%20source/home_remote_data_source.dart';
import 'package:e_commerce/Domain/Repositories/repositories/auth_repo.dart';
import 'package:e_commerce/Domain/Repositories/repositories/cart_repo.dart';
import 'package:e_commerce/Domain/Repositories/repositories/home_repo.dart';
import 'package:e_commerce/Domain/Use%20cases/add_cart_product_use_case.dart';
import 'package:e_commerce/Domain/Use%20cases/add_product_to_favourite_use_case.dart';
import 'package:e_commerce/Domain/Use%20cases/delete_cart_product_use_case.dart';
import 'package:e_commerce/Domain/Use%20cases/get_all_categories_use_case.dart';
import 'package:e_commerce/Domain/Use%20cases/get_all_products_use_case.dart';
import 'package:e_commerce/Domain/Use%20cases/get_brands_use_case.dart';
import 'package:e_commerce/Domain/Use%20cases/get_cart_products_use_case.dart';
import 'package:e_commerce/Domain/Use%20cases/login_use_case.dart';
import 'package:e_commerce/Domain/Use%20cases/register_use_case.dart';
import 'package:e_commerce/Domain/Use%20cases/update_cart_product_use_case.dart';

RegisterUseCase injectRegisterUseCase() {
  return RegisterUseCase(authRepository: injectAuthRepository());
}

AddProductToFavouriteUseCase injectAddProductToFavouriteUseCase() {
  return AddProductToFavouriteUseCase(homeRepo: injectHomeTabRepo());
}

UpdateCartProductUseCase injectUpdateCartProductUseCase() {
  return UpdateCartProductUseCase(cartRepo: injectCartRepo());
}

GetCartProductsUseCase injectGetCartProductsUseCase() {
  return GetCartProductsUseCase(cartRepo: injectCartRepo());
}

DeleteCartProductUseCase injectDeleteCartProductUseCase() {
  return DeleteCartProductUseCase(cartRepo: injectCartRepo());
}

CartRepo injectCartRepo() {
  return CartRepoImpl(
      cartRemoteDataSourceImpl: injectCartRemoteDataSourceImpl());
}
// ApiManager injectApiManager(){
// return
// }

CartRemoteDataSourceImpl injectCartRemoteDataSourceImpl() {
  return CartRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}

HomeTabRemoteDataSourceImpl injectHomeTabRemoteDataSourceImpl() {
  return HomeTabRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}

AddCartProductUseCase injectAddCartProductUseCase() {
  return AddCartProductUseCase(homeTabRepo: injectHomeTabRepo());
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

HomeRepo injectHomeTabRepo() {
  return HomeTabRepoImpl(
      homeTabRemoteDataSource: injectHomeTabRemoteDataSourceImpl());
}

HomeRemoteDataSource injectHomeTabRemoteDataSorce() {
  return HomeTabRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}

LoginUseCase injectLoginUseCase() {
  return LoginUseCase(authrepo: injectAuthRepository());
}

AuthRemoteDataSource injectAuthRemoteDataSource() {
  return AuthRemoteDataSourceImpl(api: ApiManager.getInstance());
}
