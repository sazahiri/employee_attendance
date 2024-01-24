import 'package:flutter/material.dart';

class Utils {
  static showSnakBar(String message, BuildContext context, {Color? color}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: color,
    ));
  }
}
