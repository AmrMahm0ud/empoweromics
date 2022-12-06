import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: EdgeInsets.all(8),
      errorStyle: TextStyle(color: Colors.red),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 1),
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 1),
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
      ),
    ),
  );
}
