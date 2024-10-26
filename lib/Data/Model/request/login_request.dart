class LoginRequest {
  String? email;
  String? password;

  LoginRequest({this.email, this.password});

  factory LoginRequest.fromJson(Map<String, dynamic> data) => LoginRequest(
        email: data['email'] as String?,
        password: data['password'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };
}
