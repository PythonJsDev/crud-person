import 'package:flutter/material.dart';

class AlertDialogBoxOk extends StatelessWidget {
  const AlertDialogBoxOk({super.key, required this.title, required this.message});
  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
          child: const Text('Ok'),
          onPressed :() {
            Navigator.of(context).pop();
          },
        ),
      ],

    );
  }
}