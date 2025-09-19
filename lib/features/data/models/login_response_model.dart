import '../../domain/entities/login_entity.dart';

class LoginResponseModel extends LoginEntity {
  LoginResponseModel({
    required super.status,
    required super.message,
    super.token,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      status: json['status'] ?? false,
      message: json['message'] ?? "-",
      token: json['token'] ?? "",
    );
  }
}
