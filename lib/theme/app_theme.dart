import 'package:flutter/material.dart';

class AppTheme {

  static final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    colorSchemeSeed: Colors.blue,

    appBarTheme: const AppBarTheme(
      centerTitle: true,
    ),
  );


  static final darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    colorSchemeSeed: Colors.blue,

    appBarTheme: const AppBarTheme(
      centerTitle: true,
    ),
  );

}
