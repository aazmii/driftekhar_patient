import 'package:doc_patient_libs/doc_patient_libs.dart';
import 'package:driftekhar_patient/src/extensions/extensions.dart';
import 'package:flutter/material.dart';

import 'pending.appt.card.dart';

class PendingApptList extends StatelessWidget {
  const PendingApptList({super.key, required this.appts});
  final List<Appointment> appts;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'You have ${appts.length} pending appointment(s)',
            style: context.text.titleMedium!.copyWith(
              color: Colors.grey,
            ),
          ),
          const Text(
            'Soon you willreceieve an SMS form docotor',
            style: TextStyle(color: Colors.grey),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: ListView(
                children: appts.map((appt) => ApptCard(appt: appt)).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
