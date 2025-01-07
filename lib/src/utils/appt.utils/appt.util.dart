import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc_patient_libs/doc_patient_libs.dart';
import 'package:driftekhar_patient/src/services/notification.service/nofication.service.dart';
import 'package:flutter/material.dart';

Future sendNotificationToAdmins(Appointment appt) async {
  final adminsSnapshot =
      await FirebaseFirestore.instance.collection('admins').get();

  for (final doc in adminsSnapshot.docs) {
    final adminMap = doc.data();
    if (!adminMap['isActive']) continue;
    final adminDevices = adminMap['devices'] as List;
    for (final device in adminDevices) {
      final fcmToken = device['token'];
      debugPrint('***sending notification $fcmToken***\n');
      await NotificationService.instance.sendNotificationToDevice(
        fcmToken,
        getTitle(appt.type!),
        getBody(appt),
      );
    }
  }
}

String getTitle(AppointmentType t) {
  switch (t) {
    case AppointmentType.firstTime:
      return 'New Visit Reqeuest';
    case AppointmentType.report:
      return 'Report Request';
    case AppointmentType.followUp:
      return 'Follow Up Request';
  }
}

String getBody(Appointment appt) {
  return '${appt.patientData?.name} (${appt.patientData?.age}, ${appt.patientData?.gender?.name}) wants to book an appointment at ${appt.chember?.name}';
}
