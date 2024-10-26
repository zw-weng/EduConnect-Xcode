// models/login_model.dart
class LoginModel {
  final String email;
  final String password;

  LoginModel({
    required this.email,
    required this.password,
  });

  // Optionally, you can add methods to convert this model to/from JSON for API calls
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

  static LoginModel fromJson(Map<String, dynamic> json) {
    return LoginModel(
      email: json['email'],
      password: json['password'],
    );
  }
}
