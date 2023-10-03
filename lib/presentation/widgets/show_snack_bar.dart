import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String title, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 1),
      content: Text(
        title,
        style: TextStyle(color: color),
      ),
    ),
  );
}
