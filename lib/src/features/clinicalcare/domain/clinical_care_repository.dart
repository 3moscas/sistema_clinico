import 'clinical_care.dart';

abstract class ClinicalCareRepository {
  Future<List<ClinicalCare>> findAllByStudentCpf(final String cpf);
}
