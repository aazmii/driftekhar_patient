import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc_patient_libs/doc_patient_libs.dart';

class ApptService {
  static final _firestore = FirebaseFirestore.instance;
  //check a collection if exist, return as list

  static Future<List<Appointment>> getAllFromCollection(
    String collectionName,
    List<String> docIds,
  ) async {
    List<Appointment> appts = [];
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection(collectionName)
          .where(FieldPath.documentId, whereIn: docIds)
          .get(const GetOptions(source: Source.server));
      for (var doc in querySnapshot.docs) {
        appts.add(Appointment.fromMap(doc.data() as Map<String, dynamic>));
      }
    } catch (e) {
      rethrow;
    }
    return appts;
  }
}
