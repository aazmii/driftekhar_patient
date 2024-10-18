import 'package:doc_appointment/src/models/appointment/appointment.dart';
import 'package:doc_appointment/src/models/patient/patient.data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'new.appointments.g.dart';

@riverpod
Future<List<Appointment>> pendingAppointments(
    PendingAppointmentsRef ref) async {
  return appointments;
}

final appointments = <Appointment>[
  Appointment(
    isFirstTime: true,
    dateTime: DateTime.now(),
    patientData: PatientData(
      name: 'Abullah al Mamun',
      gender: Gender.male,
      phone: '01700000000',
      age: 21,
      email: 'nU0wC@example.com',
    ),
  ),
  Appointment(
    isFirstTime: true,
    dateTime: DateTime.now(),
    patientData: PatientData(
      name: 'Jahanara Haque',
      gender: Gender.female,
      phone: '01900340500',
      age: 16,
      email: 'nU0wC@example.com',
    ),
  ),
  Appointment(
    isFirstTime: false,
    dateTime: DateTime.now(),
    patientData: PatientData(
      name: 'Omar Mamun ',
      gender: Gender.male,
      phone: '01454500000',
      age: 45,
      email: 'nU0wC@example.com',
    ),
  ),
];
