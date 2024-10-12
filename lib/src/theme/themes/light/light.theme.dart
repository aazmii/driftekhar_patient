import 'package:doc_appointment/src/theme/themes/themes.dart';
import 'package:flutter/material.dart';

ThemeData get lightTheme => ThemeData(
      visualDensity: VisualDensity.compact,
      colorSchemeSeed: Colors.teal,
      brightness: Brightness.light,
      useMaterial3: true,
      inputDecorationTheme: inputDecorationTheme,
    );
