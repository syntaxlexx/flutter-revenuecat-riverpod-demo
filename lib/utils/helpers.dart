import 'package:flutter/material.dart';

void showSnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    // duration: const Duration(milliseconds: 300),
  ));
}

void showErrorSnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    backgroundColor: Colors.amber.shade600,
  ));
}
