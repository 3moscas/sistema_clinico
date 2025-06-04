import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/data/providers/dio_provider.dart';
import '../domain/clinical_care.dart';
import '../domain/clinical_care_repository.dart';

part 'clinical_care_repository_impl.g.dart';

class ClinicalCareRepositoryImpl implements ClinicalCareRepository {
  ClinicalCareRepositoryImpl({required this.dio});
  final Dio dio;

  @override
  Future<List<ClinicalCare>> findAllByStudentCpf(final String cpf) async {
    final response = await dio.get(
      '/api/class_records/find_class_by_student_cpf?studentCpf=$cpf',
    );
    return [for (final cc in response.data as List) ClinicalCare.fromJson(cc)];
  }
}

@riverpod
ClinicalCareRepository clinicalcareRepository(final Ref ref) =>
    ClinicalCareRepositoryImpl(dio: ref.watch(dioProvider));

@riverpod
Future<List<ClinicalCare>> clinicalCareByStudentCpf(
  final Ref ref,
  final String cpf,
) async => ref.watch(clinicalcareRepositoryProvider).findAllByStudentCpf(cpf);
