import 'package:injectable/injectable.dart';

import '../../domain/entities/login_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../data_sources/remote/auth_remote_data_source.dart';
import '../data_sources/local/auth_local_data_source.dart';
import '../request_models/login_request_model.dart';

@LazySingleton(as: AuthRepository)
@injectable
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;

  AuthRepositoryImpl(
      {required this.authRemoteDataSource, required this.authLocalDataSource});

  @override
  Future<LoginEntity> login(LoginRequestModel loginRequestModel) async {
    final response = await authRemoteDataSource.login(loginRequestModel);
    authLocalDataSource.saveToken(response.token!);
    return response;
  }
}
