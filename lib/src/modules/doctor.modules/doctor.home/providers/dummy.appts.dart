import 'package:doc_appointment/src/models/appointment/appointment.dart';
import 'package:doc_appointment/src/models/patient/patient.data.dart';
import 'package:doc_appointment/src/modules/create.appointment/providers/new.appointment.provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'dummy.appts.g.dart';

@Riverpod(keepAlive: true)
List<Appointment> dummyAppts(DummyApptsRef ref) {
  return appointments;
}

final appointments = <Appointment>[
  Appointment(
    id: uuid.v4(),
    isFirstTime: true,
    // dateTime: DateTime(2023, 5, 10, 14, 30),
    patientData: PatientData(
      name: 'Jasmin Hoque',
      gender: Gender.male,
      phone: '01700000000',
      age: 21,
      email: 'nU0wC@example.com',
    ),
  ),
  Appointment(
    id: uuid.v4(),

    isFirstTime: true,
    // dateTime: DateTime(2024, 12, 25, 9, 45),
    patientData: PatientData(
      name: 'Jhon Doe',
      gender: Gender.female,
      phone: '01900340500',
      age: 16,
      email: 'nU0wC@example.com',
    ),
  ),
  Appointment(
    id: uuid.v4(),

    isFirstTime: false,
    // dateTime: DateTime(2022, 8, 17, 18, 0),
    patientData: PatientData(
      name: 'Patric Freeman',
      gender: Gender.male,
      phone: '01454500000',
      age: 45,
      email: 'nU0wC@example.com',
    ),
  ),
];
