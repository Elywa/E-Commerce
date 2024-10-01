import 'dart:convert';

import 'package:e_commerce/Domain/Entities/auth_response_entity/user_entity.dart';

class AuthResponseEntity {
  final String? message;
  final UserEntity? user;
  final String? token;

  const AuthResponseEntity({this.message, this.user, this.token});
}
