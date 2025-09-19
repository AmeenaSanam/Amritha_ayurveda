import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../injector/injector.dart';
import '../../domain/entities/patient_entity.dart';
import '../../domain/usecases/patient_usecase.dart';

@injectable
class PatientViewmodel extends ChangeNotifier {
  final PatientUsecase patientUsecase = getIt<PatientUsecase>();

  bool _isLoading = false;
  String? _errorMessage;
  List<PatientEntity> _patients = [];

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  List<PatientEntity> get patients => _patients;

  Future<void> fetchPatients() async {
    try {
      _isLoading = true;
      _errorMessage = null;
      notifyListeners();
      final response = await patientUsecase.call();
      _patients = response;
    } catch (e) {
      _patients = [];
      _errorMessage = 'Error:${e.toString()}';
      log("Exception while fetching data $_errorMessage");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
