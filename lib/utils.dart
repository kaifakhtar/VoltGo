import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

showMySnackbar(BuildContext context, String text) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(
        content: Text(
          text,
        ),
        backgroundColor: Colors.deepOrange));
}

String extractDate(String formattedDateTime) {
  final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
  final DateTime dateTime = formatter.parse(formattedDateTime);
  
  final DateFormat dateFormatter = DateFormat.yMMMMd('en_US');
  return dateFormatter.format(dateTime);
}

String extractTime(String formattedDateTime) {
  final DateTime dateTime = parseDateTime(formattedDateTime);
  final DateFormat formatter = DateFormat.jm();
  return formatter.format(dateTime);
}

DateTime parseDateTime(String formattedDateTime) {
  final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
  return formatter.parse(formattedDateTime);
}
