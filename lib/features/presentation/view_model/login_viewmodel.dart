import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../injector/injector.dart';
import '../../data/request_models/login_request_model.dart';
import '../../domain/usecases/login_usecase.dart';

@injectable
class LoginViewmodel extends ChangeNotifier {
  final LoginUsecase loginUsecase = getIt<LoginUsecase>();

  bool _isLoading = false;
  bool _isSuccess = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  bool get isSuccess => _isSuccess;
  String? get errorMessage => _errorMessage;

  Future<void> login(String username, String password) async {
    try {
      _isLoading = true;
      _errorMessage = null;
      notifyListeners();

      final response = await loginUsecase.call(
        LoginRequestModel(username: username, password: password),
      );
      if (response.status == true) {
        _isSuccess = true;
      } else {
        _isSuccess = false;
        _errorMessage = response.message;
      }
    } catch (e) {
      _errorMessage = 'Error:${e.toString()}';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
