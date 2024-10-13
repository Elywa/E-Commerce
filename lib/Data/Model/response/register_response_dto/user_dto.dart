import 'package:e_commerce/Domain/Entities/auth_response_entity/user_entity.dart';

class UserDto {
  final String? name;
  final String? email;
  final String? role;

  const UserDto({this.name, this.email, this.role});

  factory UserDto.fromJson(Map<String, dynamic> data) => UserDto(
        name: data['name'] as String?,
        email: data['email'] as String?,
        role: data['role'] as String?,
      );

  Map<String, dynamic> toJSon() => {
        'name': name,
        'email': email,
        'role': role,
      };
  UserEntity toUserEntity() {
    return UserEntity(email: email, name: name);
  }
}
