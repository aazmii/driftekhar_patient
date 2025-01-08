import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc_patient_libs/doc_patient_libs.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'chembers.provider.g.dart';

@Riverpod(keepAlive: true)
class Chembers extends _$Chembers {
  final _chembers = FirebaseFirestore.instance.collection('chembers');

  Future<List<Chember>> getChembers() async {
    QuerySnapshot querySnapshot = await _chembers.get();
    final datas = querySnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
    return datas.map((data) => Chember.fromMap(data)).toList();
  }

  @override
  Future<List<Chember>> build() async {
    return getChembers();
    // return await ChemberService.instance.getAll();
  }
}
