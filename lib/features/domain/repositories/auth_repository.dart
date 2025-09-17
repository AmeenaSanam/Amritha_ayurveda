
import 'package:amritha_ayurveda/core/error/failures.dart';
import 'package:amritha_ayurveda/features/domain/entities/login_entity.dart';

abstract class AuthRepository {
  Future<(LoginEntity?, Failures?)> login(String username, String password);
}