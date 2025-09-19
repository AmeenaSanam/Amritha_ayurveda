import 'package:injectable/injectable.dart';

import '../entities/patient_entity.dart';
import '../repositories/patient_repository.dart';

@lazySingleton
@injectable
class PatientUsecase {
  final PatientRepository patientRepository;

  PatientUsecase(this.patientRepository);

  Future<List<PatientEntity>> call() async {
    return await patientRepository.getPatientList();
  }
}
