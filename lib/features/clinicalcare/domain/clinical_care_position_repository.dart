import 'clinical_care.dart';

abstract class ClinicalCarePositionRepository {
  Future<List<ClinicalCare>> findAllByStudentCpf(
    final String cpf,
    final String position,
  );
}
