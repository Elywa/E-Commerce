import 'dart:convert';

import 'package:e_commerce/Data/Model/response/register_response_dto/error_dto.dart';
import 'package:equatable/equatable.dart';

import 'user.dart';

class RegisterResponseDto extends Equatable {
  final String? message;
  final UserDto? user;
  final String? token;
  final String? statusMsg;
  final ErrorDto? error;
  const RegisterResponseDto({
    this.message,
    this.user,
    this.token,
    this.statusMsg,
    this.error,
  });

  factory RegisterResponseDto.fromMap(Map<String, dynamic> data) {
    return RegisterResponseDto(
      message: data['message'] as String?,
      statusMsg: data['statusMsg'] as String?,
      error: data['errors'] == null
          ? null
          : ErrorDto.fromMap(data['errors'] as Map<String, dynamic>),
      user: data['user'] == null
          ? null
          : UserDto.fromMap(data['user'] as Map<String, dynamic>),
      token: data['token'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'message': message,
        'statusMsg': statusMsg,
        'user': user?.toMap(),
        'token': token,
        'errors' : error?.toMap(),
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
