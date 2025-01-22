import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc_patient_libs/doc_patient_libs.dart';
import 'package:driftekhar_patient/src/services/notification.service/nofication.service.dart';
import 'package:flutter/material.dart';

class ApptUtils {
  static Future sendNotificationToAdmins(Appointment appt) async {
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
          _getTitle(appt.type!),
          _getBody(appt),
        );
      }
    }
  }

  static String _getTitle(AppointmentType t) {
    switch (t) {
      case AppointmentType.firstTime:
        return 'New Visit Reqeuest';
      case AppointmentType.report:
        return 'Report Request';
      case AppointmentType.followUp:
        return 'Follow Up Request';
    }
  }

  static String _getBody(Appointment appt) {
    return '${appt.patientData?.name} (${appt.patientData?.age}, ${appt.patientData?.gender?.name}) wants to book an appointment at ${appt.chember?.name}. Phone: ${appt.patientData?.phone}';
  }

  static int? calculateSerial(List<Schedule> schedules, Slot bookedSlot) {
    return null; //TODO : fix this
    // final schedule = schedules.firstWhere((s) {
    //   return s.timings!.firstWhere((t) => t.start == bookedSlot.start);
    // });
    // int? slotIndex;
    // for (var i = 0; i < schedule.slots!.length; i++) {
    //   if (schedule.slots![i].start == bookedSlot.start) {
    //     slotIndex = i;
    //     break;
    //   }
    // }
    // return slotIndex;
  }
}
