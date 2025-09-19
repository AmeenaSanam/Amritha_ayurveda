import 'package:injectable/injectable.dart';

import '../../domain/entities/patient_entity.dart';
import '../../domain/repositories/patient_repository.dart';
import '../data_sources/remote/patient_remote_data_source.dart';

@LazySingleton(as: PatientRepository)
@injectable
class PatientRepositoryImpl implements PatientRepository {
  final PatientRemoteDataSource patientRemoteDataSource;
  PatientRepositoryImpl({required this.patientRemoteDataSource});

  @override
  Future<List<PatientEntity>> getPatientList() {
    return patientRemoteDataSource.getPatients();
  }
}
