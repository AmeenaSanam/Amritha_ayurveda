import 'package:amritha_ayurveda/core/error/failures.dart';
import 'package:amritha_ayurveda/core/utils/auth_storage.dart';
import 'package:amritha_ayurveda/features/domain/entities/login_entity.dart';
import 'package:amritha_ayurveda/features/domain/repositories/auth_repository.dart';

import '../data_sources.dart/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource remoteDataSource;
  final AuthStorage authStorage;

  AuthRepositoryImpl(this.remoteDataSource, this.authStorage);

  @override
  Future<(LoginEntity?, Failures?)> login(
    String username,
    String password,
  ) async {
    try {
      final response = await remoteDataSource.login(username, password);
      if (response.status && response.token != null) {
        await authStorage.setAuthToken(response.token!);
        return (response.loginEntity, null);
      } else {
        return (null, Failures(response.message));
      }
    } catch (e) {
      return (null, Failures(e.toString()));
    }
  }
}
