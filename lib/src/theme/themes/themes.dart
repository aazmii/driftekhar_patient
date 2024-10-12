import 'package:flutter/material.dart';

const inputDecorationTheme = InputDecorationTheme(
  contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blue, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);
