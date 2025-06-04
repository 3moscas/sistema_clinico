import 'package:flutter/material.dart';
import '../../../../shared/constants/colors.dart';
import '../../../treatment/presentation/treatment_description_page.dart';

class CustomFloatingActionButton extends StatefulWidget {
  const CustomFloatingActionButton({required this.onPressed, super.key});
  final VoidCallback onPressed;

  @override
  _CustomFloatingActionButtonState createState() =>
      _CustomFloatingActionButtonState();
}

class _CustomFloatingActionButtonState
    extends State<CustomFloatingActionButton> {
  @override
  Widget build(final BuildContext context) => FloatingActionButton(
    onPressed: () {
      _showAddStudentModal(context);
    },
    backgroundColor: tPrimaryColor,
    child: const Icon(Icons.add, color: Colors.white),
  );
}

void _showAddStudentModal(final BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (final BuildContext context) => SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: const AddService(),
      ),
    ),
  );
}
