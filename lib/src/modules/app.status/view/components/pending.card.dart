import 'package:doc_patient_libs/doc_patient_libs.dart';
import 'package:driftekhar_patient/src/constants/ui.dart';
import 'package:driftekhar_patient/src/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PendingCard extends StatelessWidget {
  const PendingCard({super.key, required this.appt});
  final Appointment appt;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.userLarge,
                      size: iconSize,
                      color: context.theme.primaryColor,
                    ),
                    5.toWidth,
                    Text(
                      '${appt.patientData?.name!} (${appt.patientData?.age})',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.phone,
                      size: iconSize,
                      color: context.theme.primaryColor,
                    ),
                    5.toWidth,
                    Text(
                      appt.patientData?.phone ?? '',
                    ),
                  ],
                ),
              ],
            ),
            Chip(
              color: const WidgetStatePropertyAll(Colors.black12),
              label: Text(
                appt.status?.name.capitalize ?? '',
                style: context.text.labelMedium,
              ),
            ),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Row(
            children: [
              Icon(
                FontAwesomeIcons.locationPin,
                size: iconSize,
                color: context.theme.primaryColor,
              ),
              Expanded(
                child: Text(
                  appt.chember?.name ?? '',
                  style: context.text.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
