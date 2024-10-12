import 'package:flutter/material.dart';

class VisitingSchedule {
  final List<String> weekday;
  final TimeOfDay start;
  final TimeOfDay end;

  VisitingSchedule({
    required this.weekday,
    required this.start,
    required this.end,
  });
}
