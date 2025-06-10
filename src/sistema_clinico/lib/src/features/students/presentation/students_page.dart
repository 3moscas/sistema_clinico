import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/widgets/loading_widgets.dart';
import '../data/repositories/students_repository_impl.dart';
import 'widgets/students_list_widget.dart';

class StudentsPage extends ConsumerWidget {
  const StudentsPage({super.key});

  //TODO: Definir a forma de filtro de pais

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final students = ref.watch(studentsProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Pacientes')),
      body: students.when(
        data: (final data) => StudentsListWidget(students: data),
        error: (final error, final stackTrace) => Text(stackTrace.toString()),
        loading: () => const LoadingWidget(),
      ),
    );
  }
}
