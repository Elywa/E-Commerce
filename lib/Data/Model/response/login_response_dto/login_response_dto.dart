import 'package:e_commerce/Data/Model/response/register_response_dto/user_dto.dart';
import 'package:e_commerce/Domain/Entities/auth_response_entity/auth_result_entity.dart';

class LoginResponseDto {
  final String? message;
  final UserDto? user;
  final String? token;
  final String? statusMsg;

  const LoginResponseDto({this.statusMsg, this.message, this.user, this.token});

  factory LoginResponseDto.fromJson(Map<String, dynamic> data) {
    return LoginResponseDto(
      message: data['message'] as String?,
      statusMsg: data['statusMsg'] as String?,
      user: data['user'] == null
          ? null
          : UserDto.fromJson(data['user'] as Map<String, dynamic>),
      token: data['token'] as String?,
    );
  }
  AuthResultEntity toAuthResultEntity() {
    return AuthResultEntity(token: token , user: user?.toUserEntity());
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'user': user?.toJSon(),
        'token': token,
        'statusMsg': statusMsg,
      };
}
