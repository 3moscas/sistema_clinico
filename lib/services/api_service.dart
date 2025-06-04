import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../shared/constants/api_constants.dart';

class ApiClient {
  final Dio _dio = Dio();

  FutureOr<Map<String, dynamic>> authAutenticate(
    final String cpfcrm,
    final String password,
  ) async {
    final link = dotenv.get('API_LINK') + ApiConstants.authAuthenticate;

    final requestBody = <String, dynamic>{
      'username': cpfcrm,
      'password': password,
    };

    final response = await _dio.post(link, data: requestBody);

    final auth = <String, dynamic>{
      'statusCode': response.statusCode,
      'data': response.data,
    };

    return auth;
  }

  FutureOr<Map<String, dynamic>> searchStudent(
    final String id,
    final String token,
  ) async {
    final link = dotenv.get('API_LINK') + ApiConstants.studentFindBy;

    final requestBody = <String, dynamic>{'id': id};
    final options = Options(
      headers: {'Authorization': 'Bearer $token', 'accept': '*/*'},
    );
    try {
      final dioResponse = await Dio().post(
        link,
        data: {'id': id}, // Passando o ID no corpo da solicitação
        options: Options(
          headers: {'accept': '*/*', 'Authorization': 'Bearer $token'},
        ),
      );

      final response = <String, dynamic>{
        'statusCode': dioResponse.statusCode,
        'data': dioResponse.data,
      };
      return response;
    } catch (e) {
      final response = <String, dynamic>{'erro': 'Erro: $e'};
      return response;
    }
  }

  FutureOr<Map<String, dynamic>> addStudent(
    final String cpf,
    final String name,
    final String dtype,
    final DateTime bday,
    final String image,
    final String token,
  ) async {
    final link = dotenv.get('API_LINK') + ApiConstants.studentRegister;

    final requestBody = <String, dynamic>{
      'cpf': cpf,
      'name': name,
      'disabilityType': dtype,
      'birthDate': bday.toString(),
      'studentImage': image,
    };
    final options = Options(headers: {'Authorization': 'Bearer $token'});
    try {
      final dioResponse = await _dio.post(
        link,
        data: requestBody,
        options: options,
      );

      final student = <String, dynamic>{
        'statusCode': dioResponse.statusCode,
        'data': dioResponse.data,
      };
      return student;
    } catch (e) {
      final response = <String, dynamic>{'erro': 'Erro: $token'};
      return response;
    }
  }

  Future<List<dynamic>> findAllStudents(
    final String typeUser,
    final String cpfcrm,
    final String token,
  ) async {
    if (typeUser == 'professional' || typeUser == 'family') {
      final options = Options(headers: {'Authorization': 'Bearer $token'});

      if (typeUser == 'professional') {
        try {
          final response = await _dio.get(
            options: options,
            dotenv.get('API_LINK') +
                ApiConstants.studentFindByProfessional +
                cpfcrm,
          );

          return response.data;
        } catch (e) {
          return [
            {'error': e},
          ];
        }
      }

      if (typeUser == 'family') {
        try {
          final response = await _dio.get(
            options: options,
            dotenv.get('API_LINK') + ApiConstants.studentFindByFamily + cpfcrm,
          );

          return response.data;
        } catch (e) {
          return [
            {'error': e},
          ];
        }
      }
    }
    return [
      {'error': 'Allowed user types are professional and family'},
    ];
  }

  FutureOr<Map<String, dynamic>> uploadImage(final String imageBase64) async {
    final link = dotenv.get('API_LINK') + ApiConstants.uploadImage;

    final requestBody = <String, dynamic>{'imageBase64': imageBase64};

    Response response;
    var retorno = <String, dynamic>{};
    try {
      response = await _dio.post(link, data: requestBody);

      retorno = {'statusCode': response.statusCode, 'data': response.data};
    } catch (e) {
      print(e);
    }

    return retorno;
  }

  Future<Map<String, dynamic>> registerClassRecord(
    final int professionalCrm,
    final int studentCpf,
    final List<int> imageIds,
    final String classDate,
    final String startTime,
    final String endTime,
    final String subject,
    final String status,
    final String location,
    final String discipline,
  ) async {
    final link = dotenv.get('API_LINK') + ApiConstants.classRegister;

    final requestBody = <String, dynamic>{
      'professional': {'crm': professionalCrm},
      'student': {'cpf': studentCpf},
      'imageIds': imageIds,
      'classDate': classDate,
      'startTime': startTime,
      'endTime': endTime,
      'subject': subject,
      'status': status,
      'location': location,
      'discipline': discipline,
    };

    try {
      final response = await Dio().post(
        link,
        data: requestBody,
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      return {'statusCode': response.statusCode, 'data': response.data};
    } catch (e) {
      return {'statusCode': 500, 'error': e.toString()};
    }
  }

  Future<Map<String, dynamic>> viewAllP() async {
    final link = dotenv.get('API_LINK') + ApiConstants.studentViewAll;

    try {
      final response = await Dio().get(
        link,
        // data: requestBody,
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      return {'statusCode': response.statusCode, 'data': response.data};
    } catch (e) {
      return {'statusCode': 500, 'error': e.toString()};
    }
  }

  Future<Map<String, dynamic>> viewAllClass() async {
    final link = dotenv.get('API_LINK') + ApiConstants.classResumeFind;

    try {
      final response = await Dio().get(
        link,
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      return {'statusCode': response.statusCode, 'data': response.data};
    } catch (e) {
      return {'statusCode': 500, 'error': e.toString()};
    }
  }
}
