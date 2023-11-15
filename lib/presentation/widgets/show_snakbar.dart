import 'package:flutter/material.dart';

mySnakbar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        content,
      ),
    ),
  );
}
