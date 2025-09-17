import 'dart:math';

import 'package:amritha_ayurveda/core/constant/api_url.dart';
import 'package:amritha_ayurveda/core/utils/app_logger.dart';
import 'package:amritha_ayurveda/core/utils/auth_storage.dart';

import '../../../core/network/api_client.dart';
import '../models/login_response_model.dart';

class AuthRemoteDatasource {
  final ApiClient apiClient;
  AuthRemoteDatasource(this.apiClient);

  Future<LoginResponseModel> login(String username, String password) async {
    final response = await apiClient.post(ApiUrl.login, {
      "username": username,
      "password": password,
    });
    AppLogger.logger.f(response);
    final loginResponse = LoginResponseModel.fromJson(response);
    return loginResponse;
  }
}
