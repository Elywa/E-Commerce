import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/Data/Api/api_constans.dart';
import 'package:e_commerce/Data/Model/request/login_request.dart';
import 'package:e_commerce/Data/Model/request/register_request.dart';
import 'package:e_commerce/Data/Model/response/add_cart_response_dto/add_cart_response_dto.dart';
import 'package:e_commerce/Data/Model/response/add_product_to_favourite_response_dto/add_product_to_favourite_response_dto.dart';
import 'package:e_commerce/Data/Model/response/category_or_brands_response_dto/category_or_brands_response_dto.dart';
import 'package:e_commerce/Data/Model/response/get_cart_response_dto/get_cart_response_dto/get_cart_response_dto.dart';
import 'package:e_commerce/Data/Model/response/get_user_wishlist_products_response_dto/get_user_wish_list_products_response_dto/get_user_wish_list_products_response_dto.dart';
import 'package:e_commerce/Data/Model/response/login_response_dto/login_response_dto.dart';
import 'package:e_commerce/Data/Model/response/products_response_dto/products_response_dto.dart';
import 'package:e_commerce/Data/Model/response/register_response_dto/register_response_dto.dart';
import 'package:e_commerce/Data/Model/response/remove_favourite_product_response_dto/remove_favourite_product_response_dto.dart';
import 'package:e_commerce/Domain/Entities/auth_response_entity/failures_entity.dart';
import 'package:e_commerce/Domain/Use%20cases/get_all_categories_use_case.dart';
import 'package:e_commerce/UI/Utils/Shared_Preference.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  // singleton
  ApiManager._();

  static ApiManager? _instance;

  static getInstance() {
    _instance ??= ApiManager._();
    return _instance!;
  }

  //https://ecommerce.routemisr.com/api/v1/auth/signup
  Future<Either<FailuresEntity, RegisterResponseDto>> register(String name,
      String email, String password, String rePassword, String phone) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return left(NetworkError(errMessage: 'No internet conncetion!'));
    }
    Uri url = Uri.https(ApiConstans.baseUrl, ApiConstans.registerEndPoint);
    RegisterRequest request = RegisterRequest(
        email: email,
        name: name,
        password: password,
        phone: phone,
        rePassword: rePassword);
    debugPrint(request.toString());
    var response = await http.post(url, body: request.toJson());
    var registerResponse =
        RegisterResponseDto.fromJson(jsonDecode(response.body));
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return right(registerResponse);
    } else {
      debugPrint('===============================');
      debugPrint(registerResponse.error != null
          ? registerResponse.error!.msg
          : registerResponse.message);

      return left(ServerError(
          errMessage: registerResponse.error != null
              ? registerResponse.error!.msg
              : registerResponse.message));
    }
  }

  Future<Either<FailuresEntity, LoginResponseDto>> login(
      String email, String password) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return left(NetworkError(errMessage: 'No internet conncetion!'));
    }
    Uri url = Uri.https(ApiConstans.baseUrl, ApiConstans.loginEndPoint);
    LoginRequest loginRequest = LoginRequest(email: email, password: password);
    debugPrint(loginRequest.toString());
    var response = await http.post(url, body: loginRequest.toJson());
    var loginResponse = LoginResponseDto.fromJson(jsonDecode(response.body));
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return right(loginResponse);
    } else {
      return left(ServerError(errMessage: loginResponse.message));
    }
  }

  Future<Either<FailuresEntity, CategoryOrBrandsResponseDto>>
      getAllCategories() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return left(NetworkError(errMessage: 'No internet conncetion!'));
    }
    Uri url =
        Uri.https(ApiConstans.baseUrl, ApiConstans.getAllCategoriesEndPoint);
    var response = await http.get(url);
    var categories =
        CategoryOrBrandsResponseDto.fromJson(jsonDecode(response.body));

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return right(categories);
    } else {
      return left(ServerError(errMessage: categories.message));
    }
  }

  Future<Either<FailuresEntity, CategoryOrBrandsResponseDto>>
      getAllBrands() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return left(NetworkError(errMessage: 'No internet conncetion!'));
    }
    Uri url = Uri.https(ApiConstans.baseUrl, ApiConstans.getAllBrandsEndPoint);
    var response = await http.get(url);
    var brands =
        CategoryOrBrandsResponseDto.fromJson(jsonDecode(response.body));

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return right(brands);
    } else {
      return left(ServerError(errMessage: brands.message));
    }
  }

  Future<Either<FailuresEntity, ProductsResponseDto>> getProducts() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return left(NetworkError(errMessage: 'No internet conncetion!'));
    }
    Uri url = Uri.https(ApiConstans.baseUrl, ApiConstans.getProductsEndPoint);
    var response = await http.get(url);
    var products = ProductsResponseDto.fromJson(jsonDecode(response.body));

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return right(products);
    } else {
      return left(ServerError(errMessage: products.message));
    }
  }

  Future<Either<FailuresEntity, AddCartResponseDto>> addToCart(
      String productId) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return left(NetworkError(errMessage: 'No internet conncetion!'));
    }
    var token = Hive.box('token').get('token');
    // var user = MySharedPrefrence.getData(key: 'Token');
    debugPrint("========================  token is $token");
    Uri url =
        Uri.https(ApiConstans.baseUrl, ApiConstans.addProductCartEndPoint);
    var response = await http
        .post(url, headers: {'token': token}, body: {'productId': productId});
    var addResponse = AddCartResponseDto.fromJson(jsonDecode(response.body));

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return right(addResponse);
    } else if (response.statusCode == 401) {
      return left(
        ServerError(errMessage: addResponse.message),
      );
    } else {
      return left(
        ServerError(errMessage: addResponse.message),
      );
    }
  }

  Future<Either<FailuresEntity, GetCartResponseDto>> getCartProducts() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return left(NetworkError(errMessage: 'No internet conncetion!'));
    }
    Uri url = Uri.https(ApiConstans.baseUrl, ApiConstans.getCartEndPoint);
    var response =
        await http.get(url, headers: {'token': Hive.box('token').get('token')});
    var getCartResponse =
        GetCartResponseDto.fromJson(jsonDecode(response.body));

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return right(getCartResponse);
    } else {
      return left(ServerError(errMessage: getCartResponse.message));
    }
  }

  Future<Either<FailuresEntity, GetCartResponseDto>> deleteCartProduct(
      String productId) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return left(NetworkError(errMessage: 'No internet conncetion!'));
    }
    Uri url = Uri.https(ApiConstans.baseUrl, '/api/v1/cart/$productId');
    var token = Hive.box('token').get('token');
    var response = await http.delete(url, headers: {'token': token});
    var deleteCartProductResponse =
        GetCartResponseDto.fromJson(jsonDecode(response.body));

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return right(deleteCartProductResponse);
    } else {
      return left(ServerError(errMessage: deleteCartProductResponse.message));
    }
  }

  Future<Either<FailuresEntity, GetCartResponseDto>> updateCartProduct(
      String productId, int count) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return left(NetworkError(errMessage: 'No internet conncetion!'));
    }
    Uri url = Uri.https(ApiConstans.baseUrl, '/api/v1/cart/$productId');
    var token = Hive.box('token').get('token');
    var response = await http
        .put(url, headers: {'token': token}, body: {'count': count.toString()});
    var updateCartProductResponse =
        GetCartResponseDto.fromJson(jsonDecode(response.body));

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return right(updateCartProductResponse);
    } else {
      return left(ServerError(errMessage: updateCartProductResponse.message));
    }
  }

  Future<Either<FailuresEntity, AddProductToFavouriteResponseDto>>
      addProductToFavourite(String productId) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return left(NetworkError(errMessage: 'No internet conncetion!'));
    }
    var token = Hive.box('token').get('token');
    // var user = MySharedPrefrence.getData(key: 'Token');
    debugPrint("========================  token is $token");
    Uri url = Uri.https(
        ApiConstans.baseUrl, ApiConstans.addProductToFavouriteEndPoint);
    var response = await http
        .post(url, headers: {'token': token}, body: {'productId': productId});
    var addResponse =
        AddProductToFavouriteResponseDto.fromJson(jsonDecode(response.body));

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return right(addResponse);
    } else if (response.statusCode == 401) {
      return left(
        ServerError(errMessage: addResponse.message),
      );
    } else {
      return left(
        ServerError(errMessage: addResponse.message),
      );
    }
  }

  Future<Either<FailuresEntity, GetUserWishListProductsResponseDto>>
      getWishListProducts() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return left(NetworkError(errMessage: 'No internet conncetion!'));
    }
    Uri url = Uri.https(
        ApiConstans.baseUrl, ApiConstans.addProductToFavouriteEndPoint);
    var token = Hive.box('token').get('token');
    // var user = MySharedPrefrence.getData(key: 'Token');
    debugPrint("========================  token is $token");
    var response = await http.get(url, headers: {'token': token});
    var products =
        GetUserWishListProductsResponseDto.fromJson(jsonDecode(response.body));

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return right(products);
    } else {
      return left(ServerError(errMessage: products.message));
    }
  }

  Future<Either<FailuresEntity, RemoveFavouriteProductResponseDto>>
      deleteFavouriteProduct(String productId) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return left(NetworkError(errMessage: 'No internet conncetion!'));
    }
    Uri url = Uri.https(ApiConstans.baseUrl, '/api/v1/wishlist/$productId');
    var token = Hive.box('token').get('token');
    var response = await http.delete(url, headers: {'token': token});
    var deleteFavouriteProductResponse =
        RemoveFavouriteProductResponseDto.fromJson(jsonDecode(response.body));

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return right(deleteFavouriteProductResponse);
    } else {
      return left(
          ServerError(errMessage: deleteFavouriteProductResponse.message));
    }
  }
}
