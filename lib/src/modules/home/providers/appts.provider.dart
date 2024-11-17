import 'package:doc_patient_libs/doc_patient_libs.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'appts.provider.g.dart';

@Riverpod(keepAlive: true)
class Appts extends _$Appts {
  @override
  Future<List<Appointment>> build() async {
    return await AppointmentService.instance.getAll();
  }

  void add(Appointment appt) => state = AsyncData([...?state.value, appt]);
}
