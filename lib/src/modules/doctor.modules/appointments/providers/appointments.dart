import 'package:doc_appointment/src/models/appointment/appointment.dart';
import 'package:doc_appointment/src/models/patient/patient.data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'appointments.g.dart';

@riverpod
class Appointments extends _$Appointments {
  @override
  Future<List<Appointment>> build() async {
    return appointments;
  }

  void updateAppointment(int index, Appointment appointment) {
    state = AsyncData(state.value!..[index] = appointment);
  }
}

final appointments = <Appointment>[
  Appointment(
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
