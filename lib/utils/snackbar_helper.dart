import 'package:flutter/material.dart';

void showErrorMessage(BuildContext context, {required String errorMessage}) {
  final snackBar = SnackBar(
    content: Text(errorMessage),
    backgroundColor: Colors.redAccent.withOpacity(0.1),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}