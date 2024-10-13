import 'package:e_commerce/Domain/Entities/auth_response_entity/user_entity.dart';

class LoginResponseEntity {
  String? message;
  UserEntity? user;
  String? token;

  LoginResponseEntity({this.message, this.user, this.token});
}
