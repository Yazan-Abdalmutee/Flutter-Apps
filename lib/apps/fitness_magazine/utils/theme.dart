import 'package:flutter/material.dart';

ThemeData getLightTheme() {
  return ThemeData(
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: Color(0xFF364046),
    ),
  );
}

ThemeData getDarkTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: Color(0xFF364046),
    ),
  );
}
