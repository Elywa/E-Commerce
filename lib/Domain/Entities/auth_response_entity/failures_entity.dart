class FailuresEntity {
  String? errMessage;
  FailuresEntity({required this.errMessage});
}

class ServerError extends FailuresEntity {
  ServerError({required super.errMessage});
}

class NetworkError extends FailuresEntity {
  NetworkError({required super.errMessage});
}
