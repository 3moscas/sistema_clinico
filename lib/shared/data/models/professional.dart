import 'package:json_annotation/json_annotation.dart';
import 'student.dart';

part 'professional.g.dart';

@JsonSerializable()
class Professional {
  Professional({
    required this.crm,
    required this.cpf,
    required this.name,
    required this.gender,
    required this.fieldOfWork,
    required this.address,
    required this.phone,
    required this.zipCode,
    required this.position,
    required this.birthDate,
    this.student,
  });

  factory Professional.fromJson(final Map<String, dynamic> json) =>
      _$ProfessionalFromJson(json);
  String crm;
  String cpf;
  String name;
  String gender;
  List<String> fieldOfWork;
  String? address;
  String? zipCode;
  String? phone;
  String? position;
  DateTime? birthDate;
  List<Student>? student;
  Map<String, dynamic> toJson() => _$ProfessionalToJson(this);

  @override
  String toString() =>
      'Professional(crm: $crm, name: $name, gender: $gender, fieldOfWork: $fieldOfWork, address: $address, phone: $phone, zipCode: $zipCode, position: $position, birthDate: $birthDate, student: $student)';
}
