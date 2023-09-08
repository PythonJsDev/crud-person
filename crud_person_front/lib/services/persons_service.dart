import 'dart:convert';
import 'package:crud_person_front/models/person.dart';
import 'package:crud_person_front/models/person_manipulation.dart';
import 'package:http/http.dart' as http;

import 'package:crud_person_front/models/api_response.dart';

class PersonsService {
  Future<APIResponse<List<Person>>> getPersonsList() {
    return http.get(Uri.parse('http://10.0.2.2:8000/persons/')).then(
      (data) {
        if (data.statusCode == 200) {
          final jsonData = json.decode(data.body);
          final persons = <Person>[];
          for (var item in jsonData) {
            persons.add(Person.fromJson(item));
          }
          return APIResponse<List<Person>>(data: persons);
        }
        return APIResponse<List<Person>>(
            data: <Person>[], error: true, errorMessage: 'An error occured');
      },
    ).catchError((_) => APIResponse<List<Person>>(
        data: <Person>[], error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<Person>> getPerson(String id) {
    return http
        .get(Uri.parse('http://10.0.2.2:8000/persons/$id'))
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        return APIResponse<Person>(data: Person.fromJson(jsonData));
      }
      return APIResponse<Person>(
          data: null, error: true, errorMessage: 'An error occured');
    }).catchError((_) => APIResponse<Person>(
            data: null, error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<bool>> updatePerson(String id, PersonManipulation item) {
    return http
        .put(
      Uri.parse('http://10.0.2.2:8000/persons/$id/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(item.toJson()),
    )
        .then((data) {
      if (data.statusCode == 200) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(
          data: null, error: true, errorMessage: 'An error occured');
    }).catchError((_) => APIResponse<bool>(
            data: null, error: true, errorMessage: 'An error occured'));
  }
  Future<APIResponse<bool>> createPerson(PersonManipulation item) {
    return http
        .post(
      Uri.parse('http://10.0.2.2:8000/persons/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(item.toJson()),
    )
        .then((data) {
      if (data.statusCode == 201) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(
          data: null, error: true, errorMessage: 'An error occured');
    }).catchError((_) => APIResponse<bool>(
            data: null, error: true, errorMessage: 'An error occured'));
  }
  Future<APIResponse<bool>> deletePerson(String id) {
    return http
        .delete(
      Uri.parse('http://10.0.2.2:8000/persons/$id/'),
    )
        .then((data) {
      if (data.statusCode == 204) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(
          data: null, error: true, errorMessage: 'An error occured');
    }).catchError((_) => APIResponse<bool>(
            data: null, error: true, errorMessage: 'An error occured'));
  }

}
 