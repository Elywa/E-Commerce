import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/Data/Api/api_constans.dart';
import 'package:e_commerce/Data/Model/request/login_request.dart';
import 'package:e_commerce/Data/Model/request/register_request.dart';
import 'package:e_commerce/Data/Model/response/login_response_dto/login_response_dto.dart';
import 'package:e_commerce/Data/Model/response/register_response_dto/register_response_dto.dart';
import 'package:e_commerce/Domain/Entities/auth_response_entity/failures_entity.dart';
import 'package:flutter/foundation.dart';
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
}
