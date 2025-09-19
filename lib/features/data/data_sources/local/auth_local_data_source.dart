import 'package:injectable/injectable.dart';

import '../../../../core/storage/auth_storage.dart';

abstract class AuthLocalDataSource {
  Future<void> saveToken(String token);
}

@LazySingleton(as: AuthLocalDataSource)
@injectable
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final AuthStorage authStorage;

  AuthLocalDataSourceImpl(this.authStorage);

  @override
  Future<void> saveToken(String token) {
    return authStorage.setAuthToken(token);
  }

 
}
