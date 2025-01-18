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
      final exist = await doesCollectionExist(collectionName);
      if (!exist) return [];
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

  static Future<bool> doesCollectionExist(String collectionName) async {
    try {
      // Query the collection with a limit of 1 document
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection(collectionName)
          .limit(1)
          .get();
      return querySnapshot.docs.isNotEmpty;
    } catch (e) {
      return false;
    }
  }
}
