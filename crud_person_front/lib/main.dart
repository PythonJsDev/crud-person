import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:crud_person_front/screens/person_list.dart';
import 'package:crud_person_front/services/persons_service.dart';

void setupLocator(){
  GetIt.I.registerLazySingleton(
    () => PersonsService(),
  );

}
void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PersonList(),
    );
  }
}
