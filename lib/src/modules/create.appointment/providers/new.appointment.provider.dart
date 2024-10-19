import 'package:doc_appointment/src/models/chember/chember.dart';
import 'package:doc_appointment/src/models/patient/patient.data.dart';
import 'package:doc_appointment/src/modules/create.appointment/providers/patient.provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../models/appointment/appointment.dart';

part 'new.appointment.provider.g.dart';

@Riverpod(keepAlive: true)
class NewAppointment extends _$NewAppointment {
  @override
  Appointment build() {
    return Appointment(
      patientData: ref.watch(patientProvider),
    );
  }

  set setChember(Chember chember) => state = state.copyWith(chember: chember);
  set setPatientData(PatientData patientData) =>
      state = state.copyWith(patientData: patientData);
  set setFirstTime(bool isFirstTime) =>
      state = state.copyWith(isFirstTime: isFirstTime);

  set setApptDate(DateTime apptDate) {
    state = state.copyWith(dateTime: apptDate);
  }
}
