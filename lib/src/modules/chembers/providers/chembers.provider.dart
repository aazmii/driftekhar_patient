import 'package:doc_patient_libs/doc_patient_libs.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'chembers.provider.g.dart';

@Riverpod(keepAlive: true)
class Chembers extends _$Chembers {
  @override
  Future<List<Chember>> build() async =>
      await ChemberService.instance.getAll();
}
