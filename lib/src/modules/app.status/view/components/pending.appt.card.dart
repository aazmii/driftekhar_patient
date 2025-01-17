import 'package:doc_patient_libs/doc_patient_libs.dart';
import 'package:driftekhar_patient/src/extensions/extensions.dart';
import 'package:flutter/material.dart';

class ApptCard extends StatelessWidget {
  const ApptCard({super.key, required this.appt});
  final Appointment appt;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${appt.patientData?.name!} (${appt.patientData?.age})',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(appt.type!.name.capitalize),
              ],
            ),
            Chip(
                color: const WidgetStatePropertyAll(Colors.black12),
                label: Text(
                  appt.status?.name.capitalize ?? '',
                  style: context.text.titleSmall,
                )),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(
            appt.chember?.name ?? '',
            style: context.text.titleMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
