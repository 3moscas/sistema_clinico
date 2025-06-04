import 'package:json_annotation/json_annotation.dart';
import 'family.dart';

part 'student.g.dart';

@JsonSerializable()
class Student {
  Student({
    required this.cpf,
    required this.name,
    required this.disabilityType,
    required this.birthDate,
    this.studentImage,
    this.family,
  });

  factory Student.fromJson(final Map<String, dynamic> json) =>
      _$StudentFromJson(json);
  String cpf;
  String name;
  String disabilityType;
  DateTime birthDate;
  String? studentImage;
  List<Family>? family;
  Map<String, dynamic> toJson() => _$StudentToJson(this);

  @override
  String toString() =>
      'Student(cpf: $cpf, name: $name, disabilityType: $disabilityType, birthDate: $birthDate, studentImage: $studentImage)';

  /* Cria um JSON do objeto student recebido e retorna uma string dele em formado de params
    Exemplo: cpf=40028922&name=XXXXXX&disabilityType=XXXXXX&birthDate=YYYY-MM-DD */
  String toParams(final Student student) {
    final paramsMap = student.toJson();
    paramsMap['birthDate'] = paramsMap['birthDate'].split('T')[0];
    paramsMap.removeWhere(
      (final key, final value) => value == null || value == '',
    );

    return paramsMap.entries
        .map((final entry) => '${entry.key}=${entry.value}')
        .join('&');
  }
}
