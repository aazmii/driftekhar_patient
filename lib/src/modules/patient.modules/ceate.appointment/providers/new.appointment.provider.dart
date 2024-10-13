import 'package:doc_appointment/src/extensions/extensions.dart';
import 'package:doc_appointment/src/models/chember/chember.dart';
import 'package:doc_appointment/src/models/patient/patient.data.dart';
import 'package:doc_appointment/src/modules/patient.modules/ceate.appointment/providers/patient.provider.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/appointment.dart';

part 'new.appointment.provider.g.dart';

@Riverpod(keepAlive: true)
class NewAppointment extends _$NewAppointment {
  @override
  Appointment build() {
    return Appointment(
      apptDate: DateTime.now(),
      weekDay: DateTime.now().weekDayName,
      patientData: ref.watch(patientProvider),
    );
  }

  set setChember(Chember chember) => state = state.copyWith(chember: chember);
  set setPatientData(PatientData patientData) =>
      state = state.copyWith(patientData: patientData);
  set setFirstTime(bool isFirstTime) =>
      state = state.copyWith(isFirstTime: isFirstTime);

  set setApptDate(DateTime apptDate) =>
      state = state.copyWith(apptDate: apptDate);

  set setApptTime(TimeOfDay apptTime) =>
      state = state.copyWith(apptTime: apptTime);

  set setWeekDay(String weekDay) => state = state.copyWith(weekDay: weekDay);

  set setNotifyMethod(NotifyMethod notifyMedium) =>
      state = state.copyWith(notifyMethod: notifyMedium);
}
