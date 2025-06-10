import 'clinical_care.dart';

abstract class ClinicalCareDatePositionRepository {
  Future<List<ClinicalCare>> findAllByStudentCpf(
    final String cpf,
    final String date,
    final String position,
  );
}
