import 'package:flutter/material.dart';

showMySnackbar(BuildContext context, String text) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(text,),backgroundColor: Colors.deepOrange));
}
