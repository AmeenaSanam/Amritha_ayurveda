import 'package:injectable/injectable.dart';

import '../../../../core/constant/api_url.dart';
import '../../../../core/network/api_client.dart';
import '../../models/login_response_model.dart';
import '../../request_models/login_request_model.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponseModel> login(LoginRequestModel loginRequestModel);
}

@LazySingleton(as: AuthRemoteDataSource)
@injectable
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient client;

  AuthRemoteDataSourceImpl(this.client);

  @override
  Future<LoginResponseModel> login(LoginRequestModel loginRequestModel) async {
    final response = await client.post(
      ApiUrl.login,
      loginRequestModel.tojson(),
    );

    return LoginResponseModel.fromJson(response);
  }
}
