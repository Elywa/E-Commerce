import 'dart:convert';

import 'package:equatable/equatable.dart';

class ErrorDto extends Equatable {
  final String? value;
  final String? msg;
  final String? param;
  final String? location;

  const ErrorDto({this.value, this.msg, this.param, this.location});

  factory ErrorDto.fromMap(Map<String, dynamic> data) => ErrorDto(
        value: data['value'] as String?,
        msg: data['msg'] as String?,
        param: data['param'] as String?,
        location: data['location'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'value': value,
        'msg': msg,
        'param': param,
        'location': location,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ErrorDto].
  factory ErrorDto.fromJson(String data) {
    return ErrorDto.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ErrorDto] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [value, msg, param, location];
}
