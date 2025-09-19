import 'package:injectable/injectable.dart';

import '../../data/request_models/login_request_model.dart';
import '../entities/login_entity.dart';
import '../repositories/auth_repository.dart';

@lazySingleton
@injectable
class LoginUsecase {
  final AuthRepository authRepository;

  LoginUsecase(this.authRepository);

  Future<LoginEntity> call(LoginRequestModel loginRequestModel) async {
    return authRepository.login(loginRequestModel);
  }
}
