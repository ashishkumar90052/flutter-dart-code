import 'package:flutter/material.dart';

class CustomTheme {
  static final lightTheme = ThemeData.light().copyWith(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
  );

  static final darkTheme = ThemeData.dark().copyWith(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
  );
}
