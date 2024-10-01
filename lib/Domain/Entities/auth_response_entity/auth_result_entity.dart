import 'package:e_commerce/Domain/Entities/auth_response_entity/user_entity.dart';

class AuthResultEntity {
  UserEntity? user;
  String? token;

  AuthResultEntity({this.token, this.user});
}
