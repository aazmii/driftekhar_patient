import 'package:doc_appointment/src/models/visiting.hour/visiting.hour.dart';

class Chember {
  final String? name;
  final String? address;
  final String? description;
  final String? chemberEmail;
  final VisitingSchedule? visitingHour;
  final String? hotline;
  final String? tel;
  final List<String>? cell;
  final String? web;
  final double? lat;
  final double? long;

  const Chember({
    this.name,
    this.address,
    this.description,
    this.chemberEmail,
    this.visitingHour,
    this.hotline,
    this.tel,
    this.cell,
    this.web,
    this.lat,
    this.long,
  });
}
