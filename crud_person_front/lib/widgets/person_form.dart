import 'package:crud_person_front/models/person_manipulation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:crud_person_front/services/persons_service.dart';
import 'package:crud_person_front/models/person.dart';

class PersonForm extends StatefulWidget {
  const PersonForm({super.key, required this.personId});

  final int? personId;

  @override
  State<PersonForm> createState() => _PersonFormState();
}

class _PersonFormState extends State<PersonForm> {
  final _formKey = GlobalKey<FormState>();

  PersonsService get personsService => GetIt.I<PersonsService>();
  String? errorMessage;
  Person? person;
  Map<String, dynamic> personItem = {};
  String _selectedRole = 'T';

  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _zipCodeController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _approvalRefController = TextEditingController();

  void _updatePerson() async {
    // setState(() {
    //   _isLoading = true;
    // });
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final personUpdated = PersonManipulation(
        lastName: personItem['lastName'],
        firstName: personItem['firstName'],
        email: personItem['email'],
        role: personItem['role'],
        address: personItem['address'],
        zipCode: personItem['zipCode'],
        city: personItem['city'],
        approvalRef: personItem['approvalRef'],
      );

      final result = await personsService.updatePerson(
          widget.personId.toString(), personUpdated);

      // setState(() {
      //   _isLoading = false;
      // });
    }
  }

  String? _validStringField(value, nbMaxChar) {
    if (value == null ||
        value.isEmpty ||
        value.trim().length <= 1 ||
        value.trim().length > nbMaxChar) {
      return 'Must be between 1 and $nbMaxChar characters.';
    }
    return null;
  }

  @override
  void initState() {
    personsService.getPerson(widget.personId.toString()).then(
      (response) {
        if (response.error) {
          errorMessage = response.errorMessage;
        }

        person = response.data;
        _lastNameController.text = person!.lastName;
        _firstNameController.text = person!.firstName;
        _addressController.text = person!.address;
        _zipCodeController.text = person!.zipCode.toString();
        _cityController.text = person!.city;
        _emailController.text = person!.email;
        _approvalRefController.text = person!.approvalRef;
        setState(() {
          _selectedRole = person!.role;
        });
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _lastNameController,
                    maxLength: 30,
                    decoration: const InputDecoration(
                      label: Text('Last Name'),
                    ),
                    validator: (value) {
                      return _validStringField(value, 30);
                    },
                    onSaved: (value) {
                      personItem['lastName'] = value!;
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    controller: _firstNameController,
                    maxLength: 30,
                    decoration: const InputDecoration(
                      label: Text('First Name'),
                    ),
                    validator: (value) {
                      return _validStringField(value, 30);
                    },
                    onSaved: (value) {
                      personItem['firstName'] = value!;
                    },
                  ),
                ),
              ],
            ),
            TextFormField(
              controller: _addressController,
              maxLength: 300,
              decoration: const InputDecoration(
                label: Text('Address'),
              ),
              validator: (value) {
                return _validStringField(value, 300);
              },
              onSaved: (value) {
                personItem['address'] = value!;
              },
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _zipCodeController,
                    maxLength: 5,
                    decoration: const InputDecoration(
                      label: Text('Zip Code'),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          int.tryParse(value) == null ||
                          int.tryParse(value)! <= 0) {
                        return 'Must be a valid positive number.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      personItem['zipCode'] = int.parse(value!);
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    controller: _cityController,
                    maxLength: 50,
                    decoration: const InputDecoration(
                      label: Text('City'),
                    ),
                    validator: (value) {
                      return _validStringField(value, 50);
                    },
                    onSaved: (value) {
                      personItem['city'] = value!;
                    },
                  ),
                ),
              ],
            ),
            TextFormField(
              controller: _emailController,
              maxLength: 200,
              decoration: const InputDecoration(
                label: Text('Email'),
              ),
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !value.contains('@') ||
                    !value.contains('.')) {
                  return 'Invalid Email';
                }
                return null;
              },
              onSaved: (value) {
                personItem['email'] = value!;
              },
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: DropdownButtonFormField(
                    decoration: const InputDecoration(
                      isDense: true,
                      labelText: 'Role',
                    ),
                    value: _selectedRole,
                    items: [
                      for (final role in rolesItems.entries)
                        DropdownMenuItem(
                            value: role.value, child: Text(role.key)),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedRole = value!;
                      });
                    },
                    onSaved: (value) {
                      personItem['role'] = value!;
                    },
                  ),
                ),
                if (_selectedRole == 'T') ...[
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      controller: _approvalRefController,
                      maxLength: 50,
                      decoration: const InputDecoration(
                        isDense: true,
                        label: Text('N°'),
                      ),
                      validator: (value) {
                        return _validStringField(value, 50);
                      },
                      onSaved: (value) {
                        personItem['approvalRef'] = value!;
                      },
                    ),
                  ),
                ]
              ],
            ),
            const SizedBox(height: 12),
            if (widget.personId == null) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      // _formKey.currentState!.reset();
                    },
                    child: const Text('Reset'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Add Person'),
                  ),
                ],
              ),
            ] else ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      // _formKey.currentState!.reset();
                    },
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: _updatePerson,
                    child: const Text('Update'),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
