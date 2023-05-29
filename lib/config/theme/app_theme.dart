import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: Colors.white,
    // textTheme: TextTheme(
    //   titleLarge: TextStyle(
    //     color: Colors.yellow.shade700,
    //   )
    // ),
    brightness: Brightness.dark
  );
}