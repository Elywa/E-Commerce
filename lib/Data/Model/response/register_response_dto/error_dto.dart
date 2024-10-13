class ErrorDto {
  final String? value;
  final String? msg;
  final String? param;
  final String? location;

  const ErrorDto({this.value, this.msg, this.param, this.location});

  factory ErrorDto.fromJson(Map<String, dynamic> data) => ErrorDto(
        value: data['value'] as String?,
        msg: data['msg'] as String?,
        param: data['param'] as String?,
        location: data['location'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'value': value,
        'msg': msg,
        'param': param,
        'location': location,
      };
}
