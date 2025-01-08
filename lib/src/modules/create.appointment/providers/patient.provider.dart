import 'package:doc_patient_libs/doc_patient_libs.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'patient.provider.g.dart';

@Riverpod(keepAlive: true)
class Patient extends _$Patient {
  @override
  PatientData build() => PatientData();

  set setName(String? name) => state = state.copyWith(name: name);

  set setGender(Gender? gender) => state = state.copyWith(gender: gender);

  set setPhone(String? phone) => state = state.copyWith(phone: phone);

  set setAge(int? age) => state = state.copyWith(age: age);

  set setAddress(String? address) => state = state.copyWith(address: address);
  set email(String? email) => state = state.copyWith(email: email);
}
