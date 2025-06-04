import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/data/providers/dio_provider.dart';
import '../domain/clinical_care.dart';
import '../domain/clinical_care_position_repository.dart';

part 'clinical_care_repository_position_impl.g.dart';

class ClinicalCareRepositoryImpl implements ClinicalCarePositionRepository {
  ClinicalCareRepositoryImpl({required this.dio});
  final Dio dio;

  @override
  Future<List<ClinicalCare>> findAllByStudentCpf(
    final String cpf,
    final String position,
  ) async {
    final response = await dio.get(
      '/api/class_records/find_class_by_professional_position?studentCpf=$cpf&position=$position',
    );
    return [for (final cc in response.data as List) ClinicalCare.fromJson(cc)];
  }
}

@riverpod
ClinicalCarePositionRepository clinicalcarepositionRepository(final Ref ref) =>
    ClinicalCareRepositoryImpl(dio: ref.watch(dioProvider));

@riverpod
Future<List<ClinicalCare>> clinicalCareByPosition(
  final Ref ref,
  final String cpf,
  final String position,
) async => ref
    .watch(clinicalcarepositionRepositoryProvider)
    .findAllByStudentCpf(cpf, position);
