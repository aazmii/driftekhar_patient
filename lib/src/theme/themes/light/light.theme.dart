import 'package:doc_appointment/src/theme/themes/themes.dart';
import 'package:flutter/material.dart';

ThemeData get lightTheme => ThemeData(
      visualDensity: VisualDensity.compact,
      // primarySwatch: Colors.blue,

      colorSchemeSeed: Colors.blue.shade600,
      brightness: Brightness.light,
      useMaterial3: true,
      inputDecorationTheme: inputDecorationTheme,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
