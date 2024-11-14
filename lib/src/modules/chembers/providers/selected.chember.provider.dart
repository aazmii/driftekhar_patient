import 'package:doc_patient_libs/doc_patient_libs.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'selected.chember.provider.g.dart';

@Riverpod(keepAlive: true)
class SelectedChember extends _$SelectedChember {
  @override
  Chember? build() => null;
  void update(Chember chember) {
    state = chember;
  }
}
