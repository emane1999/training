import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    useMaterial3: false,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w800,
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor:
            WidgetStateColor.resolveWith((states) => Colors.deepPurple),
      ),
    ),
  );
  static ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: false,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w800,
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor:
            WidgetStateColor.resolveWith((states) => Colors.lightBlue),
      ),
    ),
  );
}
