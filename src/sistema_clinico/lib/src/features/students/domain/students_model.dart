import 'dart:convert';

List<StudentModel> studentModelFromJson(final String str) =>
    List<StudentModel>.from(
      json.decode(str).map((final x) => StudentModel.fromJson(x)),
    );

String studentModelToJson(final List<StudentModel> data) =>
    json.encode(List<dynamic>.from(data.map((final x) => x.toJson())));

class StudentModel {
  StudentModel({
    required this.cpf,
    required this.name,
    required this.disabilityType,
    required this.birthDate,
    this.studentImage,
  });

  factory StudentModel.fromJson(final Map<String, dynamic> json) =>
      StudentModel(
        cpf: json['cpf'],
        name: json['name'],
        disabilityType: json['disabilityType'],
        birthDate: DateTime.parse(json['birthDate']),
        studentImage: json['studentImage'],
      );
  String cpf;
  String name;
  String disabilityType;
  DateTime birthDate;
  String? studentImage;

  Map<String, dynamic> toJson() => {
    'cpf': cpf,
    'name': name,
    'disabilityType': disabilityType,
    'birthDate':
        "${birthDate.year.toString().padLeft(4, '0')}-${birthDate.month.toString().padLeft(2, '0')}-${birthDate.day.toString().padLeft(2, '0')}",
    'studentImage': studentImage,
  };
}
