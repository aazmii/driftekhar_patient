import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class AppointmentService {
  // Firestore instance (can be shared across static methods)
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Create a new appointment
  static Future<void> create(String collectionName, String appointmentId,
      Map<String, dynamic> data) async {
    try {
      await _firestore.collection(collectionName).doc(appointmentId).set(data);
      debugPrint(
          'Appointment created successfully in $collectionName collection.');
    } catch (e) {
      debugPrint('Error creating appointment: $e');
    }
  }

  // Get all appointments in a specific collection
  static Future<List<Map<String, dynamic>>> get(String collectionName) async {
    try {
      final snapshot = await _firestore.collection(collectionName).get();
      return snapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      debugPrint('Error fetching appointments: $e');
      return [];
    }
  }

  // Get all appointments in a specific collection
  static Future<List<Map<String, dynamic>>> getAll(
      String collectionName) async {
    try {
      final snapshot = await _firestore.collection(collectionName).get();
      return snapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      debugPrint('Error fetching appointments: $e');
      return [];
    }
  }

  // Update an existing appointment
  static Future<void> update(String collectionName, String appointmentId,
      Map<String, dynamic> updatedData) async {
    try {
      await _firestore
          .collection(collectionName)
          .doc(appointmentId)
          .update(updatedData);
      debugPrint(
          'Appointment updated successfully in $collectionName collection.');
    } catch (e) {
      debugPrint('Error updating appointment: $e');
    }
  }

  // Delete an appointment
  static Future<void> delete(
      String collectionName, String appointmentId) async {
    try {
      await _firestore.collection(collectionName).doc(appointmentId).delete();
      debugPrint(
          'Appointment deleted successfully from $collectionName collection.');
    } catch (e) {
      debugPrint('Error deleting appointment: $e');
    }
  }

  // Move appointment to another collection
  static Future<void> moveAppointment(
      String fromCollection, String toCollection, String appointmentId) async {
    try {
      // Get the current appointment data
      final docRef = _firestore.collection(fromCollection).doc(appointmentId);
      final snapshot = await docRef.get();

      if (snapshot.exists) {
        final data = snapshot.data();

        // Add the appointment to the target collection
        await _firestore.collection(toCollection).doc(appointmentId).set(data!);

        // Remove the appointment from the original collection
        await docRef.delete();

        debugPrint('Appointment moved from $fromCollection to $toCollection.');
      } else {
        debugPrint('Appointment not found in $fromCollection collection.');
      }
    } catch (e) {
      debugPrint('Error moving appointment: $e');
    }
  }
}
