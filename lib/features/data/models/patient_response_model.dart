import '../../domain/entities/patient_entity.dart';

class PatientResponseModel extends PatientEntity {
  PatientResponseModel({
    // required this.status,
    required super.id,
    required super.name,
    required super.phone,
    super.treatment,
    super.user,
    super.dateTime,
  });

  factory PatientResponseModel.fromJson(Map<String, dynamic> json) {
    return PatientResponseModel(
      // status: json['status'],
      id: json['id'],
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      treatment:
          json['patientdetails_set'] != null &&
              (json['patientdetails_set'] as List).isNotEmpty
          ? json['patientdetails_set'][0]['treatment_name']
          : null,
      user: json['user'],
      dateTime: json['date_nd_time'] != null
          ? DateTime.tryParse(json['date_nd_time'])
          : null,
    );
  }
}

