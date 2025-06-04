import 'clinical_care.dart';

abstract class ClinicalCareDateRepository {
  Future<List<ClinicalCare>> findAllByStudentCpf(
    final String cpf,
    final String date,
  );
}
