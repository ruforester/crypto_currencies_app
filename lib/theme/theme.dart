import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(255, 30, 30, 30),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
    ),
    // centerTitle: true,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  scaffoldBackgroundColor: const Color.fromARGB(255, 30, 30, 30),
  dividerTheme: const DividerThemeData(
    color: Colors.white24,
    indent: 20,
    endIndent: 20,
  ),
  listTileTheme: const ListTileThemeData(
    iconColor: Colors.white,
  ),
  textTheme: TextTheme(
    bodyMedium: const TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    labelLarge: TextStyle(
      color: Colors.white.withOpacity(0.6),
      fontSize: 16,
      fontWeight: FontWeight.w700,
    ),
  ),
);
