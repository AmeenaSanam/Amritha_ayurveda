
import '../../data/request_models/login_request_model.dart';
import '../entities/login_entity.dart';

abstract class AuthRepository {
  Future<LoginEntity> login(LoginRequestModel loginRequestModel);
}
