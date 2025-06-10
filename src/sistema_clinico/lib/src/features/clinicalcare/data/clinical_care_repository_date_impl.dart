import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/data/providers/dio_provider.dart';
import '../domain/clinical_care.dart';
import '../domain/clinical_care_date_repository.dart';

part 'clinical_care_repository_date_impl.g.dart';

class ClinicalCareRepositoryImpl implements ClinicalCareDateRepository {
  ClinicalCareRepositoryImpl({required this.dio});
  final Dio dio;

  @override
  Future<List<ClinicalCare>> findAllByStudentCpf(
    final String cpf,
    final String date,
  ) async {
    final response = await dio.get(
      '/api/class_records/find_class_by_date?studentCpf=$cpf&date=$date',
    );
    return [for (final cc in response.data as List) ClinicalCare.fromJson(cc)];
  }
}

@riverpod
ClinicalCareDateRepository clinicalcaredateRepository(final Ref ref) =>
    ClinicalCareRepositoryImpl(dio: ref.watch(dioProvider));

@riverpod
Future<List<ClinicalCare>> clinicalCareByDate(
  final Ref ref,
  final String cpf,
  final String date,
) async => ref
    .watch(clinicalcaredateRepositoryProvider)
    .findAllByStudentCpf(cpf, date);
