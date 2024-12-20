import 'package:com.codeconnect.driftekhar.patient/src/theme/themes/themes.dart';
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
    listTileTheme: ListTileThemeData(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        tileColor: ThemeData().colorScheme.onPrimary
        // ColorScheme.fromSeed(seedColor: Colors.blue.shade600).surface,
        ),
    cardColor: ThemeData().colorScheme.onPrimary);
