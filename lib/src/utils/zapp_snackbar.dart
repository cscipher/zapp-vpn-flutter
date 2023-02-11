import 'package:flutter/material.dart';

showZappSnackbar(BuildContext context, {required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
