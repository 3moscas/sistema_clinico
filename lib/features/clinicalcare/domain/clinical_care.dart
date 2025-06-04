import 'package:json_annotation/json_annotation.dart';

import '../../../shared/data/models/google_drive_media.dart';
import '../../../shared/data/models/professional.dart';

part 'clinical_care.g.dart';

@JsonSerializable()
class ClinicalCare {
  ClinicalCare({
    required this.id,
    required this.professional,
    required this.classDate,
    required this.discipline,
    required this.subject,
    this.media,
  });

  factory ClinicalCare.fromJson(final Map<String, dynamic> json) =>
      _$ClinicalCareFromJson(json);
  int id;
  Professional professional;
  DateTime classDate;
  String discipline;
  String subject;
  Media? media;
  Map<String, dynamic> toJson() => _$ClinicalCareToJson(this);
}
