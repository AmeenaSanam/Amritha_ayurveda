import 'package:amritha_ayurveda/core/error/failures.dart';
import 'package:amritha_ayurveda/features/domain/entities/login_entity.dart';

import '../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;
  LoginUseCase(this.repository);

  Future<(LoginEntity?,Failures?)> loginCall(String username, String password) {
    return repository.login(username, password);
  }
}