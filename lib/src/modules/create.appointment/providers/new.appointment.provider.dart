import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driftekhar_patient/src/modules/create.appointment/providers/patient.provider.dart';
import 'package:doc_patient_libs/doc_patient_libs.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'new.appointment.provider.g.dart';

const uuid = Uuid();

@Riverpod(keepAlive: true)
class NewAppointment extends _$NewAppointment {
  final _pendings = FirebaseFirestore.instance.collection('pending');

  @override
  Appointment build() {
    return Appointment(
      id: uuid.v4(),
      patientData: ref.watch(patientProvider),
    );
  }

  set setChember(Chember chember) => state = state.copyWith(chember: chember);
  set setPatientData(PatientData patientData) =>
      state = state.copyWith(patientData: patientData);
  set setFirstTime(AppointmentType type) => state = state.copyWith(type: type);

  set setApptDate(DateTime apptDate) {
    state = state.copyWith(dateTime: apptDate);
  }

  void update(Appointment appt) => state = appt;

  Future<bool> createNew() async {
    try {
      await _pendings.doc(state.id!).set(state.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }
}
