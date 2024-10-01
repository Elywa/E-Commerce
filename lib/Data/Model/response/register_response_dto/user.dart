import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserDto extends Equatable {
  final String? name;
  final String? email;
  final String? role;

  const UserDto({this.name, this.email, this.role});

  factory UserDto.fromMap(Map<String, dynamic> data) => UserDto(
        name: data['name'] as String?,
        email: data['email'] as String?,
        role: data['role'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'email': email,
        'role': role,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UserDto].
  factory UserDto.fromJson(String data) {
    return UserDto.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UserDto] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [name, email, role];
}
