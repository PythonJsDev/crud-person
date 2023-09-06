import 'package:flutter/material.dart';
// import 'package:get_it/get_it.dart';

// import 'package:crud_person_front/services/persons_service.dart';
import 'package:crud_person_front/widgets/person_form.dart';
// import 'package:crud_person_front/models/person.dart';

class PersonModify extends StatelessWidget {
  const PersonModify({super.key, required this.personId});
  final int? personId;

  // bool get isEditing => widget.noteId != null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(personId == null ? 'Create person' : 'Edit person'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: PersonForm(personId: personId),
      ),
    );
  }
}
