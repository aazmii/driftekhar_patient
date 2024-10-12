import 'package:doc_appointment/src/models/visiting.hour/visiting.hour.dart';

class Appointment {
  final int id;
  final String title;
  final String description;
  final String location;
  final DateTime start;
  final DateTime end;
  final VisitingSchedule? visitingHour;
  const Appointment({
    required this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.start,
    required this.end,
    this.visitingHour,
  });
}
