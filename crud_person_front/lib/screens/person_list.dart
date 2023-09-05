import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:crud_person_front/screens/person_modify.dart';

import 'package:crud_person_front/widgets/alert_dialog_box.dart';
import 'package:crud_person_front/widgets/circular_progress.dart';
import 'package:crud_person_front/widgets/letter_in_circle.dart';

import 'package:crud_person_front/models/person.dart';
import 'package:crud_person_front/models/api_response.dart';

import 'package:crud_person_front/services/persons_service.dart';

class PersonList extends StatefulWidget {
  const PersonList({super.key});

  @override
  State<PersonList> createState() => _PersonListState();
}

class _PersonListState extends State<PersonList> {
  PersonsService get service => GetIt.I<PersonsService>();
  // List<Person> persons = [];

  APIResponse<List<Person>> _apiResponse =
      APIResponse(data: <Person>[], errorMessage: '');
  bool _isLoading = false;

  @override
  void initState() {
    _fetchPersons();
    super.initState();
  }

  _fetchPersons() async {
    setState(() {
      _isLoading = true;
    });
    _apiResponse = await service.getPersonsList();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List of persons')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const PersonModify(
                personId: null,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Builder(
        builder: (context) {
          if (_isLoading){
            return const CircularProgress();
          }
          if (_apiResponse.error) {
          return Center(child: Text(_apiResponse.errorMessage));
        }
          return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                String firstLetter = _apiResponse.data![index].lastName[0].toUpperCase();
                return Dismissible(
                  key: ValueKey(_apiResponse.data![index].id),
                  direction: DismissDirection.startToEnd,
                  onDismissed: (direction) {},
                  confirmDismiss: (direction) async {
                    final result = await showDialog(
                      context: context,
                      builder: (_) => const AlertDialogBox(
                        title: 'Warning !',
                        message: "Are you sure you want to delete this person?",
                      ),
                    );
                  
                    return result;
                  },
                  background: Container(
                    color: Colors.red,
                    padding: const EdgeInsets.only(left: 16),
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  child: Card(
                    child: ListTile(
                      leading: LetterInCircle(letter: firstLetter),
                      title: Text(
                        '${_apiResponse.data![index].lastName} ${_apiResponse.data![index].firstName}',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      subtitle: Text(_apiResponse.data![index].role),
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => PersonModify(
                            personId: _apiResponse.data![index].id,
                          ),
                        ),
                      ),
                      // trailing: const Icon(
                      //   Icons.delete,
                      //   color: Colors.red,
                      //   size: 32,
                      // ),
                    ),
                  ),
                );
              },
              // separatorBuilder: (BuildContext context, int index) => const Divider(
              //       height: 1,
              //       color: Colors.green,
              //     ),
              itemCount: _apiResponse.data!.length);
        }
      ),
    );
  }
}
