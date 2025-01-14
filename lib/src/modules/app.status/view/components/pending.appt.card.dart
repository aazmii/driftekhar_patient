import 'package:doc_patient_libs/doc_patient_libs.dart';
import 'package:driftekhar_patient/src/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
            Text(
              appt.type?.name ?? '',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Chip(
                color: const WidgetStatePropertyAll(Colors.black12),
                label: Text(appt.status?.name.capitalize ?? '')),
          ],
        ),
        subtitle: Row(
          children: [
            const Icon(FontAwesomeIcons.locationDot),
            Text(appt.chember?.name ?? '', style: context.text.titleMedium)
          ],
        ),
      ),
    );
  }
}
