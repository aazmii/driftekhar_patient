// Function to open the DateTime picker
import 'package:doc_appointment/src/app.dart';
import 'package:flutter/material.dart';

Future<DateTime?> getSelectedDateTime() async {
  final DateTime? pickedDate = await showDatePicker(
    context: navigatorKey.currentContext!,
    initialDate: DateTime.now(),
    firstDate: DateTime(2020),
    lastDate: DateTime(2030),
  );
  if (pickedDate == null) return null;

  final TimeOfDay? pickedTime = await showTimePicker(
      context: navigatorKey.currentContext!, initialTime: TimeOfDay.now());
  if (pickedTime == null) return null;

  return DateTime(
    pickedDate.year,
    pickedDate.month,
    pickedDate.day,
    pickedTime.hour,
    pickedTime.minute,
  );
}
