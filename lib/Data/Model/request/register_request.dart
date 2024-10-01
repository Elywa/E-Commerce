import 'dart:convert';

import 'package:equatable/equatable.dart';

class RegisterRequest extends Equatable {
  final String? name;
  final String? email;
  final String? password;
  final String? rePassword;
  final String? phone;

  const RegisterRequest({
    this.name,
    this.email,
    this.password,
    this.rePassword,
    this.phone,
  });

  factory RegisterRequest.fromMap(Map<String, dynamic> data) {
    return RegisterRequest(
      name: data['name'] as String?,
      email: data['email'] as String?,
      password: data['password'] as String?,
      rePassword: data['rePassword'] as String?,
      phone: data['phone'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'name': name,
        'email': email,
        'password': password,
        'rePassword': rePassword,
        'phone': phone,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [RegisterRequest].
  factory RegisterRequest.fromJson(String data) {
    return RegisterRequest.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [RegisterRequest] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [name, email, password, rePassword, phone];
}
