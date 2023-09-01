import 'dart:convert';
import 'package:crud_person_front/models/person.dart';
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
}
  // List<Person> getPersonesList() {



    // return [
    //   Person(
    //       id: 1,
    //       role: "T",
    //       email: "a@a.com",
    //       firstName: "Joe",
    //       lastName: "Doe",
    //       address: "12 rue des lilas",
    //       zipCode: 25200,
    //       city: "Ici",
    //       approvalRef: "123456pou"),
    //   Person(
    //       id: 2,
    //       role: "I",
    //       email: "b@b.com",
    //       firstName: "yoyo",
    //       lastName: "Tata",
    //       address: "35 av d'ailleurs",
    //       zipCode: 14255,
    //       city: "Ville",
    //       approvalRef: ""),
    //   Person(
    //       id: 3,
    //       role: "I",
    //       email: "c@c.com",
    //       firstName: "paul",
    //       lastName: "Actarus",
    //       address: "35 av de la lune",
    //       zipCode: 55555,
    //       city: "City",
    //       approvalRef: "uy147"),
    // ];
  // }

