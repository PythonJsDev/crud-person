import 'package:flutter/material.dart';

class PersonForm extends StatefulWidget {
  const PersonForm({super.key, required this.personId});

  final int? personId;

  @override
  State<PersonForm> createState() => _PersonFormState();
}

class _PersonFormState extends State<PersonForm> {
  final _formKey = GlobalKey<FormState>();
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
                    maxLength: 30,
                    decoration: const InputDecoration(
                      label: Text('Last Name'),
                    ),
                    // validator: (value) {
                    //   return _validStringField(value, 30);
                    // },
                    // onSaved: (value) {
                    //   person['lastName'] = value!;
                    // },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    maxLength: 30,
                    decoration: const InputDecoration(
                      label: Text('First Name'),
                    ),
                    // validator: (value) {
                    //   return _validStringField(value, 30);
                    // },
                    // onSaved: (value) {
                    //   person['firstName'] = value!;
                    // },
                  ),
                ),
              ],
            ),
            TextFormField(
              maxLength: 300,
              decoration: const InputDecoration(
                label: Text('Address'),
              ),
              // validator: (value) {
              //   return _validStringField(value, 300);
              // },
              // onSaved: (value) {
              //   person['address'] = value!;
              // },
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
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
                    // onSaved: (value) {
                    //   person['zipCode'] = int.parse(value!);
                    // },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    maxLength: 50,
                    decoration: const InputDecoration(
                      label: Text('City'),
                    ),
                    // validator: (value) {
                    //   return _validStringField(value, 50);
                    // },
                    // onSaved: (value) {
                    //   person['city'] = value!;
                    // },
                  ),
                ),
              ],
            ),
            TextFormField(
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
              // onSaved: (value) {
              //   person['email'] = value!;
              // },
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Expanded(
                //   child: DropdownButtonFormField(
                //     decoration: const InputDecoration(
                //       isDense: true,
                //       labelText: 'Role',
                //     ),
                //     // value: _selectedRole,
                //     // items: dropdownRolesItems,
                //     // onChanged: (value) {
                //     //   setState(() {
                //     //     _selectedRole = value!;
                //     //   });
                //     // },
                //     // onSaved: (value) {
                //     //   person['role'] = value!;
                //     // },
                //   ),
                // ),
                // if (_selectedRole == 'T') ...[
                const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    maxLength: 50,
                    decoration: const InputDecoration(
                      label: Text('N°'),
                    ),
                    // validator: (value) {
                    //   return _validStringField(value, 50);
                    // },
                    // onSaved: (value) {
                    //   person['approval_ref'] = value!;
                    // },
                  ),
                ),
                // ]
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
                    onPressed: () {}, // _savePerson,
                    child: const Text('Add Person'),
                  ),
                ],
              ),
            ]else ...[
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
                    onPressed: () {}, // _savePerson,
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
