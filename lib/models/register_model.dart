// models/register_model.dart
class RegisterModel {
  final String email;
  final String password;
  final String confirmPassword;

  RegisterModel({
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  // Optionally, you can add methods to convert this model to/from JSON for API calls
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
    };
  }

  static RegisterModel fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      email: json['email'],
      password: json['password'],
      confirmPassword: json['confirmPassword'],
    );
  }
}
