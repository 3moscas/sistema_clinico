import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../shared/data/providers/dio_provider.dart';
import '../../domain/students_model.dart';
import '../../domain/students_professional_repository.dart';

part 'students_professional_repository_impl.g.dart';

class StudentsRepositoryImpl implements StudentsRepository {
  StudentsRepositoryImpl({required this.dio});
  final Dio dio;

  @override
  Future<List<StudentModel>> getStudentsByName(final String nome) async {
    try {
      final response = await dio.get('/api/student/find_by?name=$nome');
      return [for (final s in response.data as List) StudentModel.fromJson(s)];
    } on DioException catch (e) {
      log('Falha ao consultar alunos. Error: ${e.error}');
      throw Exception('Falha ao consultar alunos.');
    }
  }
}

@riverpod
StudentsRepository studentsprofessionalRepository(final Ref ref) {
  final dio = ref.watch(dioProvider);
  return StudentsRepositoryImpl(dio: dio);
}

@riverpod
Future<List<StudentModel>> studentsprofessional(
  final Ref ref,
  final String nome,
) async {
  final students = await ref
      .watch(studentsprofessionalRepositoryProvider)
      .getStudentsByName(nome);
  return students;
}
