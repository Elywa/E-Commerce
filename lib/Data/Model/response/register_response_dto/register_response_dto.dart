import 'package:e_commerce/Data/Model/response/register_response_dto/error_dto.dart';
import 'package:e_commerce/Domain/Entities/auth_response_entity/auth_result_entity.dart';

import 'user_dto.dart';

class RegisterResponseDto {
  final UserDto? user;
  final String? token;
  final String? message;
  final String? statusMsg;
  final ErrorDto? error;
  const RegisterResponseDto({
    this.message,
    this.user,
    this.token,
    this.statusMsg,
    this.error,
  });

  factory RegisterResponseDto.fromJson(Map<String, dynamic> data) {
    return RegisterResponseDto(
      message: data['message'] as String?,
      statusMsg: data['statusMsg'] as String?,
      error: data['errors'] == null
          ? null
          : ErrorDto.fromJson(data['errors'] as Map<String, dynamic>),
      user: data['user'] == null
          ? null
          : UserDto.fromJson(data['user'] as Map<String, dynamic>),
      token: data['token'] as String?,
    );
  }

  AuthResultEntity toAuthResultEntity() {
    return AuthResultEntity(token: token, user: user?.toUserEntity());
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'statusMsg': statusMsg,
        'user': user?.toJSon(),
        'token': token,
        'errors': error?.toJson(),
      };
}
