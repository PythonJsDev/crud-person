import 'package:crud_person_front/widgets/person_form.dart';
import 'package:flutter/material.dart';

class PersonModify extends StatelessWidget {
  const PersonModify({super.key, required this.personId});
  final int? personId;

  // bool get isEditing => widget.noteId != null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(personId == null ? 'Create person' : 'Edit person'),
        // title: const Text('Create person'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: PersonForm(personId: personId),
      ),
    );
  }
}
