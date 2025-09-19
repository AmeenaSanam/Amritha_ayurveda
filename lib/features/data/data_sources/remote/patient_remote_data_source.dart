import 'package:injectable/injectable.dart';

import '../../../../core/constant/api_url.dart';
import '../../../../core/network/api_client.dart';
import '../../models/patient_response_model.dart';

abstract class PatientRemoteDataSource {
  Future<List<PatientResponseModel>> getPatients();
}

@LazySingleton(as: PatientRemoteDataSource)
@injectable
class PatientRemoteDataSourceImpl implements PatientRemoteDataSource {
  final ApiClient client;

  PatientRemoteDataSourceImpl(this.client);

  @override
  Future<List<PatientResponseModel>> getPatients() async {
    final response = await client.get(ApiUrl.patientList);
    if (response['status'] == true && response['patient'] != null) {
      return (response['patient'] as List)
          .map((e) => PatientResponseModel.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }
}
