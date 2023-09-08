// import 'package:crud_person_front/widgets/person_form.dart';
import 'package:flutter/material.dart';
import 'package:crud_person_front/widgets/alert_dialog_box_ok.dart';

class HelperFunctions {
  static errorMessage(result, context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialogBoxOk(
        title: 'Error',
        message: result.errorMessage,
      ),
    );
  }

  static String? validStringField(value, nbMaxChar) {
    if (value == null ||
        value.isEmpty ||
        value.trim().length <= 1 ||
        value.trim().length > nbMaxChar) {
      return 'Between 1 and $nbMaxChar characters.';
    }
    return null;
  }
}
