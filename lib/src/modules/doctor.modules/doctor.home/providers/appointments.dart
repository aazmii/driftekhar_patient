import 'package:doc_appointment/src/models/appointment/appointment.dart';
import 'package:doc_appointment/src/modules/doctor.modules/doctor.home/providers/dummy.appts.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'appointments.g.dart';

@Riverpod(keepAlive: true)
class Appointments extends _$Appointments {
  @override
  Future<List<Appointment>> build() async {
    return ref.watch(dummyApptsProvider);
  }

  void updateAppointment(int index, Appointment appointment) {
    state = AsyncData(state.value!..[index] = appointment);
  }

  void addAppointment(Appointment appointment) {
    state = AsyncData([appointment, ...state.value ?? []]);
  }

  void removeAppointment(int index) {
    state = AsyncData(state.value!..removeAt(index));
  }
}
