import 'package:flutter/material.dart';

// Theme for light mode
final lightCoffeeTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFFD7CCC8),
    foregroundColor: Color(0xFF4E342E),
    titleTextStyle: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: Color(0xFF4E342E),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Color(0xFFD7CCC8),
      backgroundColor: Color(0xFF4E342E),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: Color(0xFF6D4C41), width: 2.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: Color(0xFF4E342E), width: 2.0),
    ),
    labelStyle: TextStyle(
      color: Color(0xFF4E342E).withOpacity(0.5),
      fontWeight: FontWeight.normal,
    ),
    filled: true,
    fillColor: Color(0xFFD7CCC8),
    hintStyle: TextStyle(color: Color(0xFF4E342E).withOpacity(0.5)),
    floatingLabelStyle: TextStyle(color: Color(0xFF4E342E)),
  ),
  cardTheme: CardTheme(
    color: Color(0xFFD7CCC8),
    shadowColor: Color(0xFF4E342E),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  ),
  textTheme: TextTheme(
    headlineLarge: TextStyle(
      fontSize: 26.0,
      fontWeight: FontWeight.bold,
      color: Color(0xFF4E342E),
    ),
    headlineMedium: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.normal,
      color: Color(0xFF4E342E),
    ),
    bodyLarge: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Color(0xFF4E342E),
    ),
    bodyMedium: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
      color: Color(0xFF4E342E),
    ),
  ),
  snackBarTheme: SnackBarThemeData(
    backgroundColor: Color(0xFFD7CCC8),
    contentTextStyle: TextStyle(
      color: Color(0xFF4E342E),
      fontWeight: FontWeight.normal,
      fontSize: 16.0,
    ),
  ),
  dialogTheme: DialogTheme(
    backgroundColor: Color(0xFFD7CCC8),
    titleTextStyle: TextStyle(
      color: Color(0xFF4E342E),
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
    ),
    contentTextStyle: TextStyle(
      color: Color(0xFF4E342E),
      fontSize: 18.0,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  ),
);

// Theme for dark mode
final darkCoffeeTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: Color(0xFF242124),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF3E2723),
    foregroundColor: Color(0xFFEFEBE9),
    titleTextStyle: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: Color(0xFFEFEBE9),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Color(0xFFEFEBE9),
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: Color(0xFFEFEBE9), width: 2.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: Color(0xFFEFEBE9), width: 2.0),
    ),
    labelStyle: TextStyle(
      color: Color(0xFFEFEBE9).withOpacity(0.5),
      fontWeight: FontWeight.normal,
    ),
    filled: true,
    fillColor: Color(0xFF3E2723),
    hintStyle: TextStyle(color: Color(0xFFEFEBE9).withOpacity(0.5)),
    floatingLabelStyle: TextStyle(color: Color(0xFFEFEBE9)),
  ),
  cardTheme: CardTheme(
    color: Color(0xFF3E2723),
    shadowColor: Colors.black,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  ),
  textTheme: TextTheme(
    headlineLarge: TextStyle(
      fontSize: 26.0,
      fontWeight: FontWeight.bold,
      color: Color(0xFFEFEBE9),
    ),
    headlineMedium: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.normal,
      color: Color(0xFFEFEBE9),
    ),
    bodyLarge: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Color(0xFFEFEBE9),
    ),
    bodyMedium: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
      color: Color(0xFFEFEBE9),
    ),
  ),
  snackBarTheme: SnackBarThemeData(
    backgroundColor: Color(0xFF3E2723),
    contentTextStyle: TextStyle(
      color: Color(0xFFEFEBE9),
      fontWeight: FontWeight.normal,
      fontSize: 16.0,
    ),
  ),
  dialogTheme: DialogTheme(
    backgroundColor: Color(0xFF3E2723),
    titleTextStyle: TextStyle(
      color: Color(0xFFEFEBE9),
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
    ),
    contentTextStyle: TextStyle(
      color: Color(0xFFEFEBE9),
      fontSize: 18.0,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  ),
);
