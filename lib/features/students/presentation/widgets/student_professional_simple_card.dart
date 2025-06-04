import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../clinicalcare/presentation/clinical_professional_care_page.dart';
import '../../domain/students_model.dart';

class StudentProfessionalSimpleCard extends StatelessWidget {
  const StudentProfessionalSimpleCard({required this.student, super.key});

  final StudentModel student;

  @override
  Widget build(final BuildContext context) => Card(
    child: ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (final context) => ClinicalCarePage(student),
          ),
        );
      },
      leading: CircleAvatar(
        radius: 32,
        backgroundImage: MemoryImage(base64Decode(student.studentImage!)),
      ),
      title: Text(student.name, style: Theme.of(context).textTheme.titleLarge),
      subtitle: Text(
        student.cpf,
        style: Theme.of(context).textTheme.bodyLarge,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    ),
  );
}
