import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: Colors.grey.shade600, // main accent
    onPrimary: Colors.grey.shade600,
    secondary: Colors.grey.shade200, // fill color
    onSecondary: Colors.grey.shade500, // hint color
    tertiary: Colors.white, // border color
    error: Colors.red,
    onError: Colors.red,
    surface: Colors.grey.shade300, // background
    onSurface: Colors.grey.shade300,
    inversePrimary: Colors.grey.shade900,
  ),
);

ThemeData lMode = ThemeData.light(useMaterial3: true);
