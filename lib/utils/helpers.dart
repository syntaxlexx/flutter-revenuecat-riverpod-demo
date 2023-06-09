import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

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

DateTime? convertToDateTime(String? date) {
  if (date == null) {
    return null;
  }
  return DateTime.parse(date);
}

String fromNow(DateTime? d) {
  return d == null ? '' : timeago.format(d);
}
