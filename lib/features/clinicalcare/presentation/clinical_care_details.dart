import 'package:flutter/material.dart';
import '../domain/clinical_care.dart';

import 'widgets/ChewiePlayer.dart';

class ClinicalCareDetailWidget extends StatefulWidget {
  const ClinicalCareDetailWidget({required this.clinicalCare, super.key});

  final ClinicalCare clinicalCare;

  @override
  State<ClinicalCareDetailWidget> createState() =>
      _ClinicalCareDetailWidgetState();
}

class _ClinicalCareDetailWidgetState extends State<ClinicalCareDetailWidget> {
  @override
  Widget build(final BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Detalhes Atendimento')),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: const Icon(Icons.school),
          title: const Text('Profissional'),
          subtitle: Text(widget.clinicalCare.professional.name),
        ),
        ListTile(
          leading: const Icon(Icons.category),
          title: const Text('Disciplina'),
          subtitle: Text(widget.clinicalCare.discipline),
        ),
        ListTile(
          leading: const Icon(Icons.category),
          title: const Text('Título'),
          subtitle: Text(widget.clinicalCare.subject),
        ),
        widget.clinicalCare.media?.url == null
            ? Container()
            : ChewieVideoPlayerWidget(url: widget.clinicalCare.media!.url),
      ],
    ),
  );
}
