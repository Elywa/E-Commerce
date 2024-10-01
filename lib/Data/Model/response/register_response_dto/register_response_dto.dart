import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'user.dart';

class RegisterResponseDto extends Equatable {
  final String? message;
  final UserDto? user;
  final String? token;

  const RegisterResponseDto({this.message, this.user, this.token});

  factory RegisterResponseDto.fromMap(Map<String, dynamic> data) {
    return RegisterResponseDto(
      message: data['message'] as String?,
      user: data['user'] == null
          ? null
          : UserDto.fromMap(data['user'] as Map<String, dynamic>),
      token: data['token'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'message': message,
        'user': user?.toMap(),
        'token': token,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [RegisterResponseDto].
  factory RegisterResponseDto.fromJson(String data) {
    return RegisterResponseDto.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [RegisterResponseDto] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [message, user, token];
}
