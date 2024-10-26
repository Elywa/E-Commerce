class RegisterRequest {
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

  factory RegisterRequest.fromJson(Map<String, dynamic> data) {
    return RegisterRequest(
      name: data['name'] as String?,
      email: data['email'] as String?,
      password: data['password'] as String?,
      rePassword: data['rePassword'] as String?,
      phone: data['phone'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'password': password,
        'rePassword': rePassword,
        'phone': phone,
      };
}
