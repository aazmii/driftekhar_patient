import 'package:doc_appointment/src/models/chember/chember.dart';
import 'package:doc_appointment/src/models/visiting.hour/visiting.hour.dart';
import 'package:flutter/material.dart';

final chembers = <Chember>[
  Chember(
    name: 'Ibn Sina D.Lab Malibagh (Building 1)',
    address: 'House #490, DIT Road, Malibagh, Dhaka',
    description: 'Lift-2, Room-310',
    chemberEmail: 'ibnsinamalibagh@gmail.com',
    hotline: '0961009611',
    tel: '02-58315769-73',
    cell: ['01844141717', '01844141718'],
    web: 'www.ibnsinatrust.com',
    visitingHour: VisitingSchedule(
      start: const TimeOfDay(hour: 7, minute: 00),
      end: const TimeOfDay(hour: 7, minute: 00),
      weekday: 'Sat Wed Thurs Fri'.split(' ').toList(),
    ),
  ),
  Chember(
    name: 'Dr. Sirajul Islam Medical College & Hospital Ltd',
    address: '12/3 New Circular Road, Malibagh, Dhaka',
    description: 'Lift-4, Room-409',
    chemberEmail: 'ibnsinamalibagh@gmail.com',
    hotline: '0961009611',
    tel: '02-58315769-73',
    cell: ['01844141717', '01844141718'],
    web: 'www.ibnsinatrust.com',
    visitingHour: VisitingSchedule(
      start: const TimeOfDay(hour: 7, minute: 00),
      end: const TimeOfDay(hour: 7, minute: 00),
      weekday: 'Sat Wed Thurs Fri'.split(' ').toList(),
    ),
  ),
];
