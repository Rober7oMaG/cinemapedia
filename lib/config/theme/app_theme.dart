import 'package:flutter/material.dart';


class AppTheme {
  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: Color.fromARGB(255, 255, 221, 0),
    brightness: Brightness.dark
  );
}