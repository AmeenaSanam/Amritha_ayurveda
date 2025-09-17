import 'package:amritha_ayurveda/core/error/failures.dart';
import 'package:amritha_ayurveda/core/utils/app_logger.dart';
import 'package:amritha_ayurveda/features/domain/entities/login_entity.dart';
import 'package:flutter/material.dart';

import '../../domain/use_cases/login_usecase.dart';

class LoginViewModel extends ChangeNotifier{
  final LoginUseCase loginUseCase;
  LoginViewModel(this.loginUseCase);

  LoginEntity? _loginUser;
  Failures? _failures;
  bool _isLoading = false;
  bool _isSuccess = false;
  String? _errorMessage;

  LoginEntity? get loginUser => _loginUser;
  Failures? get failures => _failures;
  bool get isLoading => _isLoading;
  bool get isSuccess => _isSuccess;
  String? get errorMessage => _errorMessage;

  Future<void> login(String username, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final (resultLoginUser,resultFailure) = await loginUseCase.loginCall(username, password);
      _loginUser=resultLoginUser;
      _failures=resultFailure;
      _isSuccess=true;
    } catch (e) {
      _isSuccess=false;
      _errorMessage = e.toString();
      AppLogger.logger.e(_errorMessage);
    }

    _isLoading = false;
    notifyListeners();
  }

}