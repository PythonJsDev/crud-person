import 'package:flutter/material.dart';

class AlertDialogBox extends StatelessWidget {
  const AlertDialogBox({super.key, required this.title, required this.message});
  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
          child: const Text('Yes'),
          onPressed :() {
            Navigator.of(context).pop(true);
          },
        ),
        TextButton(
          child: const Text('No'),
          onPressed :() {
            Navigator.of(context).pop(false);
          },
        )
      ],

    );
  }
}