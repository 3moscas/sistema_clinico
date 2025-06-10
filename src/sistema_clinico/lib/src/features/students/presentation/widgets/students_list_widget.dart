import 'package:flutter/material.dart';
import '../../../../shared/widgets/not_found_widget.dart';
import '../../domain/students_model.dart';
import 'student_simple_card.dart';

class StudentsListWidget extends StatelessWidget {
  const StudentsListWidget({required this.students, super.key});

  final List<StudentModel> students;

  @override
  Widget build(final BuildContext context) {
    if (students.isEmpty) {
      return const NotFoundCard(text: 'Sem alunos cadastrados ainda!');
    }

    return ListView.builder(
      itemCount: students.length,
      itemBuilder: (final context, final index) =>
          StudentSimpleCard(student: students[index]),
    );
  }
}
