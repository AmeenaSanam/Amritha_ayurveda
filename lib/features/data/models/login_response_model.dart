import 'package:amritha_ayurveda/features/domain/entities/login_entity.dart';

class LoginResponseModel{
  final bool status;
  final String message;
  final String? token;
  final LoginEntity? loginEntity;

const LoginResponseModel({
   required this.status,
    required this.message,
    this.token,
    this.loginEntity,
  });

 factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      status: json["status"] ?? false,
      message: json["message"] ?? "",
      token: json["token"],
      loginEntity: json["user_details"] != null
          ? LoginEntity(
              id: json['user_details']["id"]??0,
              username: json["user_details"]["username"] ?? "",
              email: json["user_details"]["mail"] ?? "",
              phone: json["user_details"]["phone"] ?? "",
            )
          : null,
    );
  }
}
