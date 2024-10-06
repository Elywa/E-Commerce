import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/Data/Api/api_constans.dart';
import 'package:e_commerce/Data/Model/request/register_request.dart';
import 'package:e_commerce/Data/Model/response/register_response_dto/register_response_dto.dart';
import 'package:e_commerce/Domain/Entities/auth_response_entity/failures_entity.dart';
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
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConstans.baseUrl, ApiConstans.registerEndPoint);
      RegisterRequest request = RegisterRequest(
          email: email,
          name: name,
          password: password,
          phone: phone,
          rePassword: rePassword);
      var response = await http.post(url, body: request.toJson());
      var registerResponse =
          RegisterResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return right(registerResponse);
      } else {
        return left(ServerError(
            errMessage: registerResponse.error != null
                ? registerResponse.error!.msg
                : registerResponse.message));
      }
    } else {
      return left(NetworkError(errMessage: 'Check your internet connection'));
    }
  }
}
