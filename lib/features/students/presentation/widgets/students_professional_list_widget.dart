import 'package:flutter/material.dart';
import '../../../../shared/widgets/not_found_widget.dart';
import '../../domain/students_model.dart';
import 'student_professional_simple_card.dart';

class StudentsProfessionalListWidget extends StatelessWidget {
  const StudentsProfessionalListWidget({required this.students, super.key});

  final List<StudentModel> students;

  @override
  Widget build(final BuildContext context) {
    if (students.isEmpty) {
      return const NotFoundCard(text: 'Sem alunos cadastrados ainda!');
    }

    return ListView.builder(
      itemCount: students.length,
      itemBuilder: (final context, final index) =>
          StudentProfessionalSimpleCard(student: students[index]),
    );
  }
}
